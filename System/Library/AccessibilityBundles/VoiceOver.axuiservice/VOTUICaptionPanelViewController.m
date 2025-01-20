@interface VOTUICaptionPanelViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isTV;
- (UIScrollView)scrollView;
- (UITextView)captionPanelText;
- (VOTUICaptionPanelViewController)init;
- (double)_captionTextBottomInset;
- (double)captionPanelHeight;
- (double)marqueeEnableDelay;
- (void)_accessibilityLoadInvertColors;
- (void)_animateTextBack:(BOOL)a3;
- (void)_updateCaptionPanelHeight;
- (void)parseMessage:(id)a3;
- (void)setCaptionPanelHeight:(double)a3;
- (void)setCaptionPanelText:(id)a3;
- (void)setMarqueeEnableDelay:(double)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VOTUICaptionPanelViewController

- (VOTUICaptionPanelViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTUICaptionPanelViewController;
  v2 = -[VOTUICaptionPanelViewController init](&v8, "init");
  -[VOTUICaptionPanelViewController setMarqueeEnableDelay:](v2, "setMarqueeEnableDelay:", 2.0);
  v3 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  scrollingStartTimer = v2->_scrollingStartTimer;
  v2->_scrollingStartTimer = v3;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_scrollingStartTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  v5 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  resetColorsTimer = v2->_resetColorsTimer;
  v2->_resetColorsTimer = v5;

  -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v2->_resetColorsTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  return v2;
}

- (double)_captionTextBottomInset
{
  int HasHomeButton = AXDeviceHasHomeButton(self, a2);
  double result = 16.0;
  if (HasHomeButton) {
    return 2.0;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isTV
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VOTUICaptionPanelViewController;
  -[VOTUICaptionPanelViewController viewWillLayoutSubviews](&v29, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  -[VOTUICaptionPanelViewController captionPanelHeight](self, "captionPanelHeight");
  double v7 = v5 - v6;

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
  [v8 frame];
  double v10 = v9;
  -[VOTUICaptionPanelViewController captionPanelHeight](self, "captionPanelHeight");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, v7, v10, v11);

  effectView = self->_effectView;
  -[UIView bounds](self->_backgroundView, "bounds");
  double v14 = v13;
  -[UIView bounds](self->_backgroundView, "bounds");
  -[UIVisualEffectView setFrame:](effectView, "setFrame:", 0.0, 0.0, v14);
  -[VOTUICaptionPanelViewController _captionTextBottomInset](self, "_captionTextBottomInset");
  double v16 = v15;
  -[UIView bounds](self->_backgroundView, "bounds");
  -[UITextView setFrame:](self->_captionPanelText, "setFrame:", v17 + 8.0, v18 + 2.0, v19 + -16.0, v20 - (v16 + 2.0));
  if (-[VOTUICaptionPanelViewController _isTV](self, "_isTV"))
  {
    -[UIVisualEffectView setHidden:](self->_effectView, "setHidden:", 1LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 colorWithAlphaComponent:0.75]);
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v22);

    id v23 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](&OBJC_CLASS___UIColor, "systemWhiteColor"));
    id v24 = [v23 CGColor];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    [v25 setBorderColor:v24];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    [v26 setBorderWidth:2.0];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    [v27 setCornerRadius:8.0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_backgroundView, "layer"));
    [v28 setMasksToBounds:1];
  }

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  -[VOTUICaptionPanelViewController captionPanelHeight](self, "captionPanelHeight", a4);
  double v8 = height - v7;
  -[VOTUICaptionPanelViewController captionPanelHeight](self, "captionPanelHeight");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, v8, width, v9);
  effectView = self->_effectView;
  -[UIView frame](self->_backgroundView, "frame");
  double v12 = v11;
  -[UIView frame](self->_backgroundView, "frame");
  -[UIVisualEffectView setFrame:](effectView, "setFrame:", 0.0, 0.0, v12);
  -[VOTUICaptionPanelViewController _captionTextBottomInset](self, "_captionTextBottomInset");
  double v14 = v13;
  -[UIView bounds](self->_backgroundView, "bounds");
  -[UITextView setFrame:](self->_captionPanelText, "setFrame:", v15 + 8.0, v16 + 2.0, v17 + -16.0, v18 - (v14 + 2.0));
}

- (void)_updateCaptionPanelHeight
{
  if (-[VOTUICaptionPanelViewController _isTV](self, "_isTV"))
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    [v3 setFont:v18];

    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
    [v4 frame];
    -[VOTUICaptionPanelViewController setCaptionPanelHeight:](self, "setCaptionPanelHeight:", v5 / 10.0);

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
    [v6 setNeedsLayout];
  }

  else
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithPreferredContentSizeCategory:",  UIContentSizeCategoryLarge));
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:compatibleWithTraitCollection:",  UIFontTextStyleCaption1,  v7));

    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    [v8 setFont:v6];

    [v6 lineHeight];
    double v10 = v9 + 20.0;
    id v11 = [v18 lineHeight];
    double v13 = v10 - v12;
    int HasHomeButton = AXDeviceHasHomeButton(v11, v14);
    double v16 = v13 + 14.0;
    if (HasHomeButton) {
      double v16 = v13;
    }
    -[VOTUICaptionPanelViewController setCaptionPanelHeight:](self, "setCaptionPanelHeight:", v16);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
    [v17 setNeedsLayout];
  }
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___VOTUICaptionPanelViewController;
  -[VOTUICaptionPanelViewController viewDidLoad](&v45, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
  [v3 setAccessibilityElementsHidden:1];

  double v4 = objc_alloc(&OBJC_CLASS___UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v8 = -[UIView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
  [v10 addSubview:self->_backgroundView];

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 3LL));
  id v11 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v41);
  effectView = self->_effectView;
  self->_effectView = v11;

  -[UIVisualEffectView setClipsToBounds:](self->_effectView, "setClipsToBounds:", 0LL);
  -[UIView addSubview:](self->_backgroundView, "addSubview:", self->_effectView);
  double v13 = -[UIScrollView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIScrollView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTUICaptionPanelViewController setScrollView:](self, "setScrollView:", v13);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v15 = -[UITextView initWithFrame:]( objc_alloc(&OBJC_CLASS___UITextView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[VOTUICaptionPanelViewController setCaptionPanelText:](self, "setCaptionPanelText:", v15);

  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v17 setBackgroundColor:v16];

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](&OBJC_CLASS___UIColor, "systemWhiteColor"));
  [v18 setTextColor:v19];

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v20 setTextAlignment:0];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v21 setAdjustsFontForContentSizeCategory:1];

  v22 = self->_backgroundView;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  -[UIView addSubview:](v22, "addSubview:", v23);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v24 addSubview:v25];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v40 widthAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_backgroundView, "widthAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v38 multiplier:0.9]);
  v47[0] = v37;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 heightAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_backgroundView, "heightAnchor"));
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v28 multiplier:1.0]);
  v47[1] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 centerXAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_backgroundView, "centerXAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v32 constant:0.0]);
  v47[2] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 3LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v34);

  -[VOTUICaptionPanelViewController _updateCaptionPanelHeight](self, "_updateCaptionPanelHeight");
  -[VOTUICaptionPanelViewController _accessibilityLoadInvertColors](self, "_accessibilityLoadInvertColors");
  objc_initWeak(&location, self);
  uint64_t v46 = objc_opt_class(&OBJC_CLASS___UITraitPreferredContentSizeCategory);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10794;
  v42[3] = &unk_24928;
  objc_copyWeak(&v43, &location);
  id v36 =  -[VOTUICaptionPanelViewController registerForTraitChanges:withHandler:]( self,  "registerForTraitChanges:withHandler:",  v35,  v42);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTUICaptionPanelViewController;
  -[VOTUICaptionPanelViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTUICaptionPanelViewController;
  -[VOTUICaptionPanelViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)parseMessage:(id)a3
{
  id v4 = a3;
  -[VOTUICaptionPanelViewController _hostContextId](self, "_hostContextId");
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"VoiceOverCaptionText"]);
  double v6 = (NSString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"VoiceOverCaptionSpokenRange"]);

  NSRange v7 = NSRangeFromString(v6);
  NSUInteger length = v7.length;

  uint64_t v9 = VOTLogCommon();
  double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", v7.location, v7.length));
    *(_DWORD *)buf = 138412290;
    v115 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Handling caption panel message: %@", buf, 0xCu);
  }

  double v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "]);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 text]);
  unsigned __int8 v15 = -[__CFString isEqualToString:](v12, "isEqualToString:", v14);

  double v16 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  if (v12) {
    double v17 = v12;
  }
  else {
    double v17 = &stru_253B8;
  }
  id v18 = -[NSMutableAttributedString initWithString:](v16, "initWithString:", v17);
  double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v19,  0LL,  -[NSMutableAttributedString length](v18, "length"));

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 font]);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 font]);
    -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  NSFontAttributeName,  v23,  0LL,  -[NSMutableAttributedString length](v18, "length"));

    NSUInteger length = v7.length;
  }

  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  if (v7.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v120.NSUInteger length = (NSUInteger)-[NSMutableAttributedString length](v18, "length");
    v120.NSUInteger location = 0LL;
    v121.NSUInteger location = v7.location;
    v121.NSUInteger length = length;
    NSRange v25 = NSIntersectionRange(v120, v121);
    NSUInteger location = v25.location;
    NSUInteger length = v25.length;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](&OBJC_CLASS___UIColor, "yellowColor"));
    -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v26,  v25.location,  v25.length);

    -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  NSUnderlineStyleAttributeName,  &off_25AB0,  v25.location,  v25.length);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v27 setAttributedText:v18];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  [v29 frame];
  objc_msgSend(v28, "sizeThatFits:", 3.40282347e38, v30);
  double v32 = v31;

  if ((v15 & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    objc_msgSend(v34, "setContentOffset:animated:", 0, 0.0, 0.0);

    -[UIViewPropertyAnimator stopAnimation:](self->_scrollingAnimator, "stopAnimation:", 1LL);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    [v35 frame];
    double v37 = v36;

    AXDeviceHasHomeButton(v38, v39);
    double v40 = v32 + 10.0;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    [v41 frame];
    double v43 = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    [v44 frame];
    double v46 = v45;

    if (v32 + 10.0 < v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
      [v47 frame];
      double v40 = v48;
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    objc_msgSend(v49, "setFrame:", 0.0, v37, v40, v43);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    objc_msgSend(v50, "setContentSize:", v40, v43);
  }

  v51 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableParagraphStyle, v33);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController view](self, "view"));
  [v52 bounds];
  double v54 = v53;

  if (v32 <= v54) {
    uint64_t v55 = 1LL;
  }
  else {
    uint64_t v55 = 4LL;
  }
  [v51 setAlignment:v55];
  -[NSMutableAttributedString addAttribute:value:range:]( v18,  "addAttribute:value:range:",  NSParagraphStyleAttributeName,  v51,  0LL,  -[NSMutableAttributedString length](v18, "length"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v56 setAttributedText:v18];

  resetColorsTimer = self->_resetColorsTimer;
  -[VOTUICaptionPanelViewController marqueeEnableDelay](self, "marqueeEnableDelay");
  double v59 = v58;
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472LL;
  v109[2] = sub_11240;
  v109[3] = &unk_24950;
  v60 = v12;
  v110 = v60;
  v61 = v18;
  v111 = v61;
  v112 = self;
  id v62 = v51;
  id v113 = v62;
  -[AXDispatchTimer afterDelay:processBlock:](resetColorsTimer, "afterDelay:processBlock:", v109, v59);
  scrollingStartTimer = self->_scrollingStartTimer;
  -[VOTUICaptionPanelViewController marqueeEnableDelay](self, "marqueeEnableDelay");
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472LL;
  v108[2] = sub_11378;
  v108[3] = &unk_247D0;
  v108[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](scrollingStartTimer, "afterDelay:processBlock:", v108);
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    NSUInteger v66 = length;
    v67 = (void *)objc_claimAutoreleasedReturnValue([v65 beginningOfDocument]);
    v68 = (void *)objc_claimAutoreleasedReturnValue([v64 positionFromPosition:v67 offset:location]);

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 beginningOfDocument]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v69 positionFromPosition:v71 offset:v66 + location]);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 textRangeFromPosition:v68 toPosition:v72]);
    [v73 firstRectForRange:v75];
    double v77 = v76;
    double v79 = v78;
    double v81 = v80;
    double v83 = v82;

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView", v83 + v81 + v77 + v79));
    [v84 contentOffset];
    CGFloat v86 = v85;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    [v87 frame];
    double v89 = v88;
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
    [v90 frame];
    CGFloat v92 = v91;

    v122.origin.x = v77;
    v122.origin.double y = v79;
    CGFloat v106 = v81;
    v122.size.double width = v81;
    v122.size.double height = v83;
    double MaxX = CGRectGetMaxX(v122);
    v123.origin.double y = 0.0;
    v123.origin.x = v86;
    v123.size.double width = v89;
    v123.size.double height = v92;
    if (MaxX > CGRectGetMaxX(v123))
    {
      double v94 = v77 + v89 / -5.0;
      double v95 = fabs(v94);
      BOOL v96 = (unint64_t)(*(void *)&v95 - 1LL) < 0xFFFFFFFFFFFFFLL;
      BOOL v97 = v94 < 0.0 && (unint64_t)(*(void *)&v95 - 0x10000000000000LL) >> 53 < 0x3FF;
      if (v94 >= 0.0) {
        BOOL v96 = 0;
      }
      int v98 = v95 == INFINITY || v96;
      if ((v98 | v97) == 1)
      {
        uint64_t v99 = VOTLogCommon();
        v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v124.origin.x = v77;
          v124.origin.double y = v79;
          v124.size.double width = v106;
          v124.size.double height = v83;
          v101 = NSStringFromRect(v124);
          v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
          v125.origin.double y = 0.0;
          v125.origin.x = v86;
          v125.size.double width = v89;
          v125.size.double height = v92;
          v103 = NSStringFromRect(v125);
          v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v77 + v89 / -5.0));
          *(_DWORD *)buf = 138412802;
          v115 = v102;
          __int16 v116 = 2112;
          v117 = v104;
          __int16 v118 = 2112;
          v119 = v105;
          _os_log_error_impl(&dword_0, v100, OS_LOG_TYPE_ERROR, "Bad x for caption panel offset: %@ %@ %@", buf, 0x20u);
        }
      }

      else
      {
        if (!UIAccessibilityIsReduceMotionEnabled())
        {
          v107[0] = _NSConcreteStackBlock;
          v107[1] = 3221225472LL;
          v107[2] = sub_11384;
          v107[3] = &unk_24820;
          v107[4] = self;
          *(double *)&v107[5] = v77 + v89 / -5.0;
          +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v107, 0.15);
          goto LABEL_34;
        }

        v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
        -[os_log_s setContentOffset:animated:](v100, "setContentOffset:animated:", 0LL, v77 + v89 / -5.0, 0.0);
      }
    }

- (void)_animateTextBack:(BOOL)a3
{
  BOOL v3 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_11600;
  v23[3] = &unk_247D0;
  v23[4] = self;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v23);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  [v5 contentSize];
  double v7 = v6;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController scrollView](self, "scrollView"));
  [v8 bounds];
  double v10 = v7 - v9;

  if (v10 <= 0.0)
  {
    -[UIViewPropertyAnimator stopAnimation:](self->_scrollingAnimator, "stopAnimation:", 1LL);
  }

  else if (v3)
  {
    objc_initWeak(&location, self);
    id v11 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 text]);
    uint64_t v14 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v11,  "initWithDuration:curve:animations:",  3,  0,  (float)(unint64_t)[v13 length] / 10.0);
    scrollingAnimator = self->_scrollingAnimator;
    self->_scrollingAnimator = v14;

    double v16 = self->_scrollingAnimator;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_11638;
    v20[3] = &unk_24978;
    objc_copyWeak(&v21, &location);
    -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v20);
    double v17 = self->_scrollingAnimator;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_11728;
    v18[3] = &unk_249A0;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&v10;
    -[UIViewPropertyAnimator addAnimations:delayFactor:](v17, "addAnimations:delayFactor:", v18, 0.0);
    -[UIViewPropertyAnimator startAnimationAfterDelay:](self->_scrollingAnimator, "startAnimationAfterDelay:", 1.0);
    objc_destroyWeak(v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

- (void)_accessibilityLoadInvertColors
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUICaptionPanelViewController captionPanelText](self, "captionPanelText"));
  [v3 setAccessibilityIgnoresInvertColors:1];

  -[UIVisualEffectView setAccessibilityIgnoresInvertColors:]( self->_effectView,  "setAccessibilityIgnoresInvertColors:",  1LL);
}

- (UITextView)captionPanelText
{
  return self->_captionPanelText;
}

- (void)setCaptionPanelText:(id)a3
{
}

- (double)marqueeEnableDelay
{
  return self->_marqueeEnableDelay;
}

- (void)setMarqueeEnableDelay:(double)a3
{
  self->_marqueeEnableDeladouble y = a3;
}

- (double)captionPanelHeight
{
  return self->_captionPanelHeight;
}

- (void)setCaptionPanelHeight:(double)a3
{
  self->_captionPanelHeight = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end