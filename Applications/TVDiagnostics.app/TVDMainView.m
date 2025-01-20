@interface TVDMainView
- (BOOL)displayDeviceIdentifier:(id)a3;
- (BOOL)setDeviceIdentifierVisible:(BOOL)a3;
- (DACheckAnimationView)checkAnimationView;
- (DADeviceIdentifierView)deviceIdentifier;
- (NSLayoutConstraint)deviceIdentifierHeightConstraint;
- (TVDMainView)initWithFrame:(CGRect)a3;
- (TVDMainViewDelegate)delegate;
- (TVDMarqueeButton)closeButton;
- (TVDMarqueeButton)historyButton;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)applicationTitleLabel;
- (UILabel)statusLabel;
- (UIProgressView)progressView;
- (UIView)contentView;
- (void)closeTapped:(id)a3;
- (void)doneTapped:(id)a3;
- (void)hideProgressView:(BOOL)a3;
- (void)hideText:(BOOL)a3;
- (void)historyTapped:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setApplicationTitleLabel:(id)a3;
- (void)setCheckAnimationView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceIdentifierHeightConstraint:(id)a3;
- (void)setHistoryButton:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)showActivityIndicator:(BOOL)a3;
- (void)showButtonsAndApplicationTitle;
- (void)showCloseButtonWithDone:(BOOL)a3;
- (void)updateConstraints;
- (void)updateProgress:(id)a3;
- (void)updateText:(id)a3;
- (void)updateWithDeviceState:(id)a3;
@end

@implementation TVDMainView

- (TVDMainView)initWithFrame:(CGRect)a3
{
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___TVDMainView;
  v3 = -[TVDMainView initWithFrame:](&v80, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVDMainView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(&OBJC_CLASS___UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = -[UILabel initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    applicationTitleLabel = v3->_applicationTitleLabel;
    v3->_applicationTitleLabel = v9;

    -[UILabel setContentMode:](v3->_applicationTitleLabel, "setContentMode:", 7LL);
    LODWORD(v11) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:]( v3->_applicationTitleLabel,  "setContentHuggingPriority:forAxis:",  0LL,  v11);
    LODWORD(v12) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:]( v3->_applicationTitleLabel,  "setContentHuggingPriority:forAxis:",  1LL,  v12);
    -[UILabel setTextAlignment:](v3->_applicationTitleLabel, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v3->_applicationTitleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setNumberOfLines:](v3->_applicationTitleLabel, "setNumberOfLines:", 4LL);
    -[UILabel setBaselineAdjustment:](v3->_applicationTitleLabel, "setBaselineAdjustment:", 2LL);
    -[UILabel setPreferredMaxLayoutWidth:](v3->_applicationTitleLabel, "setPreferredMaxLayoutWidth:", 960.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v3->_applicationTitleLabel, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_applicationTitleLabel, "setTextColor:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_applicationTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = v15;

    -[UILabel setContentMode:](v3->_statusLabel, "setContentMode:", 7LL);
    LODWORD(v17) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_statusLabel, "setContentHuggingPriority:forAxis:", 0LL, v17);
    LODWORD(v18) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_statusLabel, "setContentHuggingPriority:forAxis:", 1LL, v18);
    -[UILabel setTextAlignment:](v3->_statusLabel, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v3->_statusLabel, "setLineBreakMode:", 4LL);
    -[UILabel setNumberOfLines:](v3->_statusLabel, "setNumberOfLines:", 6LL);
    -[UILabel setBaselineAdjustment:](v3->_statusLabel, "setBaselineAdjustment:", 2LL);
    -[UILabel setPreferredMaxLayoutWidth:](v3->_statusLabel, "setPreferredMaxLayoutWidth:", 960.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v3->_statusLabel, "setFont:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_statusLabel, "setTextColor:", v20);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_statusLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v21 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    contentView = v3->_contentView;
    v3->_contentView = v21;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_contentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v23 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = v23;

    LODWORD(v25) = 1144750080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:]( v3->_activityIndicator,  "setContentHuggingPriority:forAxis:",  0LL,  v25);
    LODWORD(v26) = 1144750080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:]( v3->_activityIndicator,  "setContentHuggingPriority:forAxis:",  1LL,  v26);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_activityIndicator,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v27 = -[UIProgressView initWithProgressViewStyle:]( objc_alloc(&OBJC_CLASS___UIProgressView),  "initWithProgressViewStyle:",  0LL);
    progressView = v3->_progressView;
    v3->_progressView = v27;

    LODWORD(v29) = 0;
    -[UIProgressView setProgress:](v3->_progressView, "setProgress:", v29);
    LODWORD(v30) = 1144750080;
    -[UIProgressView setContentHuggingPriority:forAxis:]( v3->_progressView,  "setContentHuggingPriority:forAxis:",  1LL,  v30);
    -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_progressView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v31 = objc_alloc(&OBJC_CLASS___DACheckAnimationView);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v33 = -[DACheckAnimationView initWithFrame:color:scale:]( v31,  "initWithFrame:color:scale:",  v32,  CGRectZero.origin.x,  y,  width,  height,  2.6);
    checkAnimationView = v3->_checkAnimationView;
    v3->_checkAnimationView = v33;

    -[DACheckAnimationView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_checkAnimationView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[TVDMarqueeButton buttonWithType:](&OBJC_CLASS___TVDMarqueeButton, "buttonWithType:", 1LL));
    closeButton = v3->_closeButton;
    v3->_closeButton = (TVDMarqueeButton *)v35;

    -[TVDMarqueeButton setHidden:](v3->_closeButton, "setHidden:", 1LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v37 setAdjustsFontSizeToFitWidth:1];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v38 setMinimumScaleFactor:0.57];

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v39 setContentMode:7];

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v40 setTextAlignment:1];

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v41 setBaselineAdjustment:1];

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v42 setLineBreakMode:5];

    v43 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_closeButton, "titleLabel"));
    [v44 setFont:v43];

    v45 = v3->_closeButton;
    id v46 = sub_1000182A4(@"CLOSE");
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    -[TVDMarqueeButton setTitle:forState:](v45, "setTitle:forState:", v47, 0LL);

    v48 = v3->_closeButton;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVDMarqueeButton setTitleColor:forState:](v48, "setTitleColor:forState:", v49, 0LL);

    v50 = v3->_closeButton;
    id v51 = sub_1000182A4(@"CLOSE");
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    -[TVDMarqueeButton setTitle:forState:](v50, "setTitle:forState:", v52, 8LL);

    v53 = v3->_closeButton;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVDMarqueeButton setTitleColor:forState:](v53, "setTitleColor:forState:", v54, 8LL);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVDMarqueeButton setBackgroundColor:](v3->_closeButton, "setBackgroundColor:", v55);

    -[TVDMarqueeButton addTarget:action:forControlEvents:]( v3->_closeButton,  "addTarget:action:forControlEvents:",  v3,  "closeTapped:",  0x2000LL);
    -[TVDMarqueeButton setTranslatesAutoresizingMaskIntoConstraints:]( v3->_closeButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v56 = objc_claimAutoreleasedReturnValue(+[TVDMarqueeButton buttonWithType:](&OBJC_CLASS___TVDMarqueeButton, "buttonWithType:", 1LL));
    historyButton = v3->_historyButton;
    v3->_historyButton = (TVDMarqueeButton *)v56;

    -[TVDMarqueeButton setHidden:](v3->_historyButton, "setHidden:", 1LL);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v58 setAdjustsFontSizeToFitWidth:1];

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v59 setMinimumScaleFactor:0.57];

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v60 setContentMode:7];

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v61 setTextAlignment:1];

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v62 setBaselineAdjustment:1];

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v63 setLineBreakMode:5];

    v64 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMarqueeButton titleLabel](v3->_historyButton, "titleLabel"));
    [v65 setFont:v64];

    v66 = v3->_historyButton;
    id v67 = sub_1000182A4(@"HISTORY");
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    -[TVDMarqueeButton setTitle:forState:](v66, "setTitle:forState:", v68, 0LL);

    v69 = v3->_historyButton;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVDMarqueeButton setTitleColor:forState:](v69, "setTitleColor:forState:", v70, 0LL);

    v71 = v3->_historyButton;
    id v72 = sub_1000182A4(@"HISTORY");
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    -[TVDMarqueeButton setTitle:forState:](v71, "setTitle:forState:", v73, 8LL);

    v74 = v3->_historyButton;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[TVDMarqueeButton setTitleColor:forState:](v74, "setTitleColor:forState:", v75, 8LL);

    v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVDMarqueeButton setBackgroundColor:](v3->_historyButton, "setBackgroundColor:", v76);

    -[TVDMarqueeButton addTarget:action:forControlEvents:]( v3->_historyButton,  "addTarget:action:forControlEvents:",  v3,  "historyTapped:",  0x2000LL);
    -[TVDMarqueeButton setTranslatesAutoresizingMaskIntoConstraints:]( v3->_historyButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v77 = -[DADeviceIdentifierView initWithFrame:]( objc_alloc(&OBJC_CLASS___DADeviceIdentifierView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    deviceIdentifier = v3->_deviceIdentifier;
    v3->_deviceIdentifier = v77;

    -[DADeviceIdentifierView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_deviceIdentifier,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[DADeviceIdentifierView setHidden:](v3->_deviceIdentifier, "setHidden:", 1LL);
    -[TVDMainView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_applicationTitleLabel);
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_statusLabel);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_activityIndicator);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_progressView);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_checkAnimationView);
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_contentView);
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_closeButton);
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_historyButton);
    -[TVDMainView addSubview:](v3, "addSubview:", v3->_deviceIdentifier);
  }

  return v3;
}

- (void)updateWithDeviceState:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  [v5 updateWithDeviceState:v4];
}

- (void)updateText:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  [v5 setText:v4];
}

- (void)hideText:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  [v4 setHidden:v3];
}

- (void)showActivityIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView activityIndicator](self, "activityIndicator"));
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (void)updateProgress:(id)a3
{
  id v9 = a3;
  [v9 floatValue];
  float v5 = v4 / 100.0;
  if ((float)(v4 / 100.0) >= 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
    id v7 = [v9 BOOLValue];
    *(float *)&double v8 = v5;
    [v6 setProgress:v7 animated:v8];
  }
}

- (void)hideProgressView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
  [v4 setHidden:v3];
}

- (void)closeTapped:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView delegate](self, "delegate", a3));
  [v4 mainViewDidReceiveCloseAction:self];
}

- (void)doneTapped:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView delegate](self, "delegate", a3));
  [v4 mainViewDidReceiveDoneAction:self];
}

- (void)historyTapped:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView delegate](self, "delegate", a3));
  [v4 mainViewDidReceiveHistoryAction:self];
}

- (void)showButtonsAndApplicationTitle
{
  id v3 = sub_1000182A4(@"DIAGNOSTICS");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  [v5 setText:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  [v6 setHidden:0];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  [v7 setHidden:0];
}

- (void)showCloseButtonWithDone:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  if (v3)
  {
    id v6 = sub_1000182A4(@"DONE");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 setTitle:v7 forState:0];

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v8 setTitleColor:v9 forState:0];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    id v11 = sub_1000182A4(@"DONE");
    double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v10 setTitle:v12 forState:8];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v13 setTitleColor:v14 forState:8];
    v15 = &selRef_doneTapped_;
    v16 = &selRef_closeTapped_;
  }

  else
  {
    id v17 = sub_1000182A4(@"CLOSE");
    double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v5 setTitle:v18 forState:0];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v19 setTitleColor:v20 forState:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    id v22 = sub_1000182A4(@"CLOSE");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v21 setTitle:v23 forState:8];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v13 setTitleColor:v14 forState:8];
    v15 = &selRef_closeTapped_;
    v16 = &selRef_doneTapped_;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  [v24 removeTarget:self action:*v16 forControlEvents:0x2000];

  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  [v25 addTarget:self action:*v15 forControlEvents:0x2000];

  id v26 = (id)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  [v26 setHidden:0];
}

- (BOOL)setDeviceIdentifierVisible:(BOOL)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006234;
  v4[3] = &unk_10002C910;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(&_dispatch_main_q, v4);
  return 1;
}

- (BOOL)displayDeviceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  [v5 setDeviceIdentifier:v4];

  return 1;
}

- (void)updateConstraints
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v6,  7LL,  0LL,  0LL,  0LL,  1.0,  960.0));
  [v5 addConstraint:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v8,  8LL,  1LL,  0LL,  0LL,  1.0,  36.0));

  LODWORD(v10) = 1144750080;
  [v9 setPriority:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  [v11 addConstraint:v9];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView applicationTitleLabel](self, "applicationTitleLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v14,  3LL,  0LL,  v15,  11LL,  1.0,  40.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v16);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  7LL,  0LL,  0LL,  0LL,  1.0,  960.0));
  [v17 addConstraint:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  8LL,  1LL,  0LL,  0LL,  1.0,  36.0));

  LODWORD(v22) = 1144750080;
  [v21 setPriority:v22];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  [v23 addConstraint:v21];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  double v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v24,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v25);

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v27,  7LL,  0LL,  0LL,  0LL,  1.0,  960.0));
  [v26 addConstraint:v28];

  double v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  double v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v30,  8LL,  0LL,  0LL,  0LL,  1.0,  140.0));
  [v29 addConstraint:v31];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v32,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView statusLabel](self, "statusLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v34,  3LL,  0LL,  v35,  11LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView activityIndicator](self, "activityIndicator"));
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v38,  9LL,  0LL,  v39,  9LL,  1.0,  0.0));
  [v37 addConstraint:v40];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView activityIndicator](self, "activityIndicator"));
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v42,  10LL,  0LL,  v43,  10LL,  1.0,  0.0));
  [v41 addConstraint:v44];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
  id v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v46,  7LL,  0LL,  0LL,  0LL,  1.0,  550.0));
  [v45 addConstraint:v47];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
  id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v49,  9LL,  0LL,  v50,  9LL,  1.0,  0.0));
  [v48 addConstraint:v51];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView progressView](self, "progressView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v53,  10LL,  0LL,  v54,  10LL,  1.0,  0.0));
  [v52 addConstraint:v55];

  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v57,  7LL,  0LL,  0LL,  0LL,  1.0,  62.4));
  [v56 addConstraint:v58];

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v60,  8LL,  0LL,  0LL,  0LL,  1.0,  46.8));
  [v59 addConstraint:v61];

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v63,  9LL,  0LL,  v64,  9LL,  1.0,  0.0));
  [v62 addConstraint:v65];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  id v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView checkAnimationView](self, "checkAnimationView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v67,  10LL,  0LL,  v68,  10LL,  1.0,  0.0));
  [v66 addConstraint:v69];

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  id v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v70,  7LL,  0LL,  v71,  7LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v73,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView contentView](self, "contentView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v75,  3LL,  0LL,  v76,  4LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifierHeightConstraint](self, "deviceIdentifierHeightConstraint"));
  if (!v78)
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
    objc_super v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v79,  8LL,  0LL,  0LL,  0LL,  1.0,  0.0));
    -[TVDMainView setDeviceIdentifierHeightConstraint:](self, "setDeviceIdentifierHeightConstraint:", v80);

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifierHeightConstraint](self, "deviceIdentifierHeightConstraint"));
    [v81 addConstraint:v82];
  }

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView deviceIdentifier](self, "deviceIdentifier"));
  v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v83,  3LL,  0LL,  v84,  4LL,  1.0,  30.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v85);

  v86 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v86,  7LL,  0LL,  v87,  7LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v90,  8LL,  0LL,  0LL,  0LL,  1.0,  66.0));
  [v89 addConstraint:v91];

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v92,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v93);

  v94 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v95,  7LL,  -1LL,  0LL,  0LL,  1.0,  960.0));
  [v94 addConstraint:v96];

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v98,  7LL,  1LL,  0LL,  0LL,  1.0,  380.0));
  [v97 addConstraint:v99];

  v100 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v101,  8LL,  0LL,  0LL,  0LL,  1.0,  66.0));
  [v100 addConstraint:v102];

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView closeButton](self, "closeButton"));
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v103,  3LL,  0LL,  v104,  4LL,  1.0,  14.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v105);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v106,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v107);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[TVDMainView historyButton](self, "historyButton"));
  v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self,  4LL,  0LL,  v108,  4LL,  1.0,  0.0));
  -[TVDMainView addConstraint:](self, "addConstraint:", v109);

  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___TVDMainView;
  -[TVDMainView updateConstraints](&v110, "updateConstraints");
}

- (TVDMainViewDelegate)delegate
{
  return (TVDMainViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DACheckAnimationView)checkAnimationView
{
  return self->_checkAnimationView;
}

- (void)setCheckAnimationView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UILabel)applicationTitleLabel
{
  return self->_applicationTitleLabel;
}

- (void)setApplicationTitleLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (TVDMarqueeButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (TVDMarqueeButton)historyButton
{
  return self->_historyButton;
}

- (void)setHistoryButton:(id)a3
{
}

- (DADeviceIdentifierView)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSLayoutConstraint)deviceIdentifierHeightConstraint
{
  return self->_deviceIdentifierHeightConstraint;
}

- (void)setDeviceIdentifierHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end