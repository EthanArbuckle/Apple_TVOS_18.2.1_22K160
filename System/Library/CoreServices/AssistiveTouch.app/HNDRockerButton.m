@interface HNDRockerButton
+ (HNDRockerButton)buttonWithTitle:(id)a3 imageName:(id)a4 downBlock:(id)a5 upBlock:(id)a6 dataSource:(id)a7 showWithGuidedAccess:(BOOL)a8 showWithAssistiveAccess:(BOOL)a9;
+ (id)_dummyImage;
- (BOOL)_inSelectedState;
- (BOOL)canBecomeFocused;
- (BOOL)continueHighlightAfterTouch;
- (BOOL)customTitle;
- (BOOL)disabled;
- (BOOL)highlighted;
- (BOOL)isAccessibilityElement;
- (BOOL)isBackButton;
- (BOOL)isEmptyFavorite;
- (BOOL)isModalDown;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)selected;
- (BOOL)showWithAssistiveAccess;
- (BOOL)showWithGuidedAccess;
- (CGRect)accessibilityFrame;
- (HNDRockerButton)initWithImageName:(id)a3;
- (HNDRockerButtonDataSource)dataSource;
- (NSString)imageName;
- (NSString)location;
- (NSString)title;
- (NSString)type;
- (UIImage)deviceSpecificImage;
- (UIImage)overrideImage;
- (UIImage)selectedImage;
- (UIImage)unselectedImage;
- (UIImageView)imageView;
- (UILabel)label;
- (UIView)imageViewContainerView;
- (double)_screenHeight;
- (id)_deviceSpecificImageForName:(id)a3 screenHeight:(double)a4;
- (id)accessibilityLabel;
- (id)currentImage;
- (id)description;
- (id)downBlock;
- (id)substantialTransitionOccurredBlock;
- (id)upBlock;
- (id)viewForLastBaselineLayout;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateFont;
- (void)_updateImage;
- (void)_updateImageView;
- (void)_updateLabelText;
- (void)dealloc;
- (void)getDeviceSpecificImageForColor:(id)a3 withCompletion:(id)a4;
- (void)handleFingerDriftedAway;
- (void)handleRealCancelEvent:(CGPoint)a3;
- (void)handleRealDownEvent:(CGPoint)a3;
- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4;
- (void)performPress:(BOOL)a3;
- (void)resetImages;
- (void)setContinueHighlightAfterTouch:(BOOL)a3;
- (void)setCustomTitle:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDownBlock:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setIsBackButton:(BOOL)a3;
- (void)setIsEmptyFavorite:(BOOL)a3;
- (void)setIsModalDown:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setOverrideImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedImage:(id)a3;
- (void)setShowWithAssistiveAccess:(BOOL)a3;
- (void)setShowWithGuidedAccess:(BOOL)a3;
- (void)setSubstantialTransitionOccurredBlock:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUnselectedImage:(id)a3;
- (void)setUpBlock:(id)a3;
- (void)updateTextColor;
@end

@implementation HNDRockerButton

+ (HNDRockerButton)buttonWithTitle:(id)a3 imageName:(id)a4 downBlock:(id)a5 upBlock:(id)a6 dataSource:(id)a7 showWithGuidedAccess:(BOOL)a8 showWithAssistiveAccess:(BOOL)a9
{
  BOOL v9 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [objc_allocWithZone((Class)HNDRockerButton) initWithImageName:v17];

  [v19 setTitle:v18];
  [v19 setDownBlock:v16];

  [v19 setUpBlock:v15];
  [v19 setDataSource:v14];

  [v19 setShowWithGuidedAccess:v9];
  [v19 setShowWithAssistiveAccess:a9];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 imageView]);
  LODWORD(v21) = 1148846080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 imageView]);
  LODWORD(v23) = 1148846080;
  [v22 setContentCompressionResistancePriority:1 forAxis:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v19 imageView]);
  LODWORD(v25) = 1148846080;
  [v24 setContentHuggingPriority:0 forAxis:v25];

  v26 = (void *)objc_claimAutoreleasedReturnValue([v19 imageView]);
  LODWORD(v27) = 1148846080;
  [v26 setContentHuggingPriority:1 forAxis:v27];

  return (HNDRockerButton *)v19;
}

+ (id)_dummyImage
{
  if (qword_1001576A8 != -1) {
    dispatch_once(&qword_1001576A8, &stru_100123378);
  }
  return (id)qword_1001576A0;
}

- (HNDRockerButton)initWithImageName:(id)a3
{
  id v64 = a3;
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___HNDRockerButton;
  v4 = -[HNDRockerButton init](&v74, "init");
  -[HNDRockerButton setClipsToBounds:](v4, "setClipsToBounds:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[HNDRockerButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[HNDRockerButton setAlpha:](v4, "setAlpha:", 1.0);
  id obj = (id)objc_opt_new(&OBJC_CLASS___AXDynamicTypeImageView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssistiveTouchLayoutView fontMetrics](&OBJC_CLASS___AXAssistiveTouchLayoutView, "fontMetrics"));
  [obj setFontMetrics:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssistiveTouchLayoutView imageMinimumContentSizeCategory]( &OBJC_CLASS___AXAssistiveTouchLayoutView,  "imageMinimumContentSizeCategory"));
  [obj setMinimumContentSizeCategory:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssistiveTouchLayoutView imageMaximumContentSizeCategory]( &OBJC_CLASS___AXAssistiveTouchLayoutView,  "imageMaximumContentSizeCategory"));
  [obj setMaximumContentSizeCategory:v8];

  objc_storeStrong((id *)&v4->_imageView, obj);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  *(void *)&double v10 = objc_opt_class(v4, v9).n128_u64[0];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_dummyImage", v10));
  -[UIImageView setImage:](v4->_imageView, "setImage:", v12);

  -[HNDRockerButton setImageName:](v4, "setImageName:", v64);
  v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
  label = v4->_label;
  v4->_label = v13;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v4->_label, "setBackgroundColor:", v15);

  -[UILabel setAdjustsFontSizeToFitWidth:](v4->_label, "setAdjustsFontSizeToFitWidth:", 1LL);
  -[UILabel setClipsToBounds:](v4->_label, "setClipsToBounds:", 0LL);
  -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 2LL);
  -[HNDRockerButton _updateFont](v4, "_updateFont");
  -[HNDRockerButton updateTextColor](v4, "updateTextColor");
  -[HNDRockerButton addSubview:](v4, "addSubview:", v4->_imageView);
  -[HNDRockerButton addSubview:](v4, "addSubview:", v4->_label);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_label, "topAnchor"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v4->_imageView, "centerYAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17 constant:32.0]);

  LODWORD(v18) = 1148829696;
  [v69 setPriority:v18];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton leadingAnchor](v4, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20]);

  LODWORD(v21) = 1132003328;
  [v68 setPriority:v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton leadingAnchor](v4, "leadingAnchor"));
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23]);

  LODWORD(v24) = 1132003328;
  [v67 setPriority:v24];
  double v25 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton trailingAnchor](v4, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);

  LODWORD(v27) = 1132003328;
  [v66 setPriority:v27];
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton trailingAnchor](v4, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);

  LODWORD(v30) = 1132003328;
  [v65 setPriority:v30];
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v4->_imageView, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton topAnchor](v4, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
  v76[0] = v61;
  v76[1] = v69;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_label, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintGreaterThanOrEqualToAnchor:v59]);
  v76[2] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_label, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton bottomAnchor](v4, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v56]);
  v76[3] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4->_label, "centerXAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v4->_imageView, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53]);
  v76[4] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v4->_imageView, "centerXAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton centerXAnchor](v4, "centerXAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
  v76[5] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton leadingAnchor](v4, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintGreaterThanOrEqualToAnchor:v47]);
  v76[6] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton leadingAnchor](v4, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintGreaterThanOrEqualToAnchor:v31]);
  v76[7] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton trailingAnchor](v4, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintLessThanOrEqualToAnchor:v34]);
  v76[8] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton trailingAnchor](v4, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintLessThanOrEqualToAnchor:v37]);
  v76[9] = v38;
  v76[10] = v68;
  v76[11] = v67;
  v76[12] = v66;
  v76[13] = v65;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 14LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v39);

  objc_initWeak(&location, v4);
  uint64_t v40 = objc_opt_self(&OBJC_CLASS___UITraitPreferredContentSizeCategory);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v75 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472LL;
  v71[2] = sub_10003F61C;
  v71[3] = &unk_1001233A0;
  objc_copyWeak(&v72, &location);
  id v43 = -[HNDRockerButton registerForTraitChanges:withHandler:](v4, "registerForTraitChanges:withHandler:", v42, v71);

  objc_destroyWeak(&v72);
  objc_destroyWeak(&location);

  return v4;
}

- (void)_traitCollectionDidChange:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 preferredContentSizeCategory]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 preferredContentSizeCategory]);
  unsigned __int8 v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    -[HNDRockerButton _updateFont](self, "_updateFont");
    -[HNDRockerButton _updateLabelText](self, "_updateLabelText");
  }

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void)_updateFont
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXAssistiveTouchLayoutView labelFont](&OBJC_CLASS___AXAssistiveTouchLayoutView, "labelFont"));
  -[UILabel setFont:](self->_label, "setFont:", v3);
}

- (void)_updateImage
{
}

- (void)_updateImageView
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[HNDRockerButton currentImage](self, "currentImage"));
  if ([UIApp userInterfaceLayoutDirection] == (id)1
    && AXUIAssistiveTouchIconRequiresRTLFlipping(self->_imageName))
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v9 imageWithHorizontallyFlippedOrientation]);

    id v9 = (id)v3;
  }

  if (-[NSString isEqualToString:](self->_imageName, "isEqualToString:", @"AT_pinned_narrow_for_flipping"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v9 imageWithHorizontallyFlippedOrientation]);

    uint64_t v5 = v4;
    if (v4) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v5 = (uint64_t)v9;
    if (v9) {
      goto LABEL_9;
    }
  }

  *(void *)&double v6 = objc_opt_class(self, v5).n128_u64[0];
  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_dummyImage", v6));
LABEL_9:
  id v10 = (id)v5;
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);
  double v8 = 0.5;
  if (!self->_disabled) {
    double v8 = 1.0;
  }
  -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v8);
}

- (void)setImageName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_imageName != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_imageName, a3);
    -[HNDRockerButton _updateImage](self, "_updateImage");
    uint64_t v5 = v6;
  }
}

- (void)setOverrideImage:(id)a3
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003F97C;
  block[3] = &unk_100121D18;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)setUpBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id upBlock = self->_upBlock;
  self->_id upBlock = v4;
}

- (void)setDownBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id downBlock = self->_downBlock;
  self->_id downBlock = v4;
}

- (void)handleRealDownEvent:(CGPoint)a3
{
  if (!-[HNDRockerButton highlighted](self, "highlighted", a3.x, a3.y)) {
    -[HNDRockerButton performPress:](self, "performPress:", 1LL);
  }
}

- (void)handleFingerDriftedAway
{
  if (-[HNDRockerButton isModalDown](self, "isModalDown")) {
    -[HNDRockerButton performPress:](self, "performPress:", 0LL);
  }
}

- (void)handleRealCancelEvent:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[HNDRockerButton isModalDown](self, "isModalDown"))
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
    unsigned int v7 = [v6 isVoiceControlRunning];

    if (v7)
    {
      -[HNDRockerButton setHighlighted:](self, "setHighlighted:", 0LL);
      id v13 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton window](self, "window"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 screen]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayIdentity]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayManagerForDisplayId:", objc_msgSend(v10, "displayID")));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 hardwareIdentifier]);
      [v13 menuExitedOnDisplay:v12];
    }

    else
    {
      -[HNDRockerButton handleFingerDriftedAway](self, "handleFingerDriftedAway");
    }
  }

  else
  {
    -[HNDRockerButton handleRealUpEvent:maxOrb:](self, "handleRealUpEvent:maxOrb:", x, y, 0.0);
  }

- (void)handleRealUpEvent:(CGPoint)a3 maxOrb:(double)a4
{
  if (-[HNDRockerButton pointInside:withEvent:](self, "pointInside:withEvent:", 0LL, a3.x, a3.y, a4))
  {
    -[HNDRockerButton performPress:](self, "performPress:", 0LL);
  }

  else
  {
    -[HNDRockerButton handleFingerDriftedAway](self, "handleFingerDriftedAway");
    -[HNDRockerButton setHighlighted:](self, "setHighlighted:", 0LL);
  }

- (void)performPress:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[HNDRockerButton disabled](self, "disabled"))
  {
    if (v3)
    {
      -[HNDRockerButton setHighlighted:](self, "setHighlighted:", 1LL);
      uint64_t v5 = 4LL;
    }

    else
    {
      -[HNDRockerButton setHighlighted:]( self,  "setHighlighted:",  -[HNDRockerButton continueHighlightAfterTouch](self, "continueHighlightAfterTouch"));
      uint64_t v5 = 5LL;
    }

    Class v6 = (&self->super.super.super.super.isa)[v5];
    if (v6) {
      ((void (*)(Class, HNDRockerButton *))v6[2].isa)(v6, self);
    }
  }

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  -[UIImageView frame](self->_imageView, "frame", a4);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[UILabel frame](self->_label, "frame");
  v24.origin.CGFloat x = v15;
  v24.origin.CGFloat y = v16;
  v24.size.width = v17;
  v24.size.height = v18;
  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  CGRect v22 = CGRectUnion(v21, v24);
  CGRect v23 = CGRectInset(v22, -20.0, -20.0);
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  return CGRectContainsPoint(v23, v20);
}

- (BOOL)_inSelectedState
{
  if (-[HNDRockerButton highlighted](self, "highlighted") || (BOOL v3 = -[HNDRockerButton selected](self, "selected"))) {
    LOBYTE(v3) = !-[HNDRockerButton disabled](self, "disabled");
  }
  return v3;
}

- (void)resetImages
{
  selectedImage = self->_selectedImage;
  self->_selectedImage = 0LL;

  unselectedImage = self->_unselectedImage;
  self->_unselectedImage = 0LL;
}

- (id)currentImage
{
  if (-[HNDRockerButton _inSelectedState](self, "_inSelectedState"))
  {
    p_selectedImage = &self->_selectedImage;
    selectedImage = self->_selectedImage;
    if (!selectedImage)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.37,  0.79,  0.96,  1.0));
      double v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      CGFloat v15 = sub_10003FEB4;
      CGFloat v16 = &unk_1001233C8;
      CGFloat v17 = self;
      Class v6 = &v13;
LABEL_6:
      -[HNDRockerButton getDeviceSpecificImageForColor:withCompletion:]( self,  "getDeviceSpecificImageForColor:withCompletion:",  v5,  v6,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17);

      selectedImage = *p_selectedImage;
    }
  }

  else
  {
    p_selectedImage = &self->_unselectedImage;
    selectedImage = self->_unselectedImage;
    if (!selectedImage)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      CGFloat v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472LL;
      CGFloat v10 = sub_10003FF3C;
      double v11 = &unk_1001233C8;
      CGFloat v12 = self;
      Class v6 = &v8;
      goto LABEL_6;
    }
  }

  return selectedImage;
}

- (void)getDeviceSpecificImageForColor:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[HNDRockerButton overrideImage](self, "overrideImage"));
  if (!v8)
  {
    uint64_t v9 = self->_imageName;
    if (-[NSString length](v9, "length"))
    {
      -[HNDRockerButton _screenHeight](self, "_screenHeight");
      uint64_t v11 = v10;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      double v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100040154;
      v15[3] = &unk_1001233F0;
      v15[4] = self;
      CGFloat v16 = v9;
      uint64_t v19 = v11;
      id v17 = v6;
      id v18 = v7;
      dispatch_async(v13, v15);

      uint64_t v14 = v16;
    }

    else
    {
      if (!v7)
      {
LABEL_8:

        goto LABEL_9;
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100040144;
      v20[3] = &unk_1001222F0;
      CGRect v21 = (NSString *)v7;
      AXPerformBlockAsynchronouslyOnMainThread(v20);
      uint64_t v14 = v21;
    }

    goto LABEL_8;
  }

  (*((void (**)(id, void *))v7 + 2))(v7, v8);
LABEL_9:
}

- (id)_deviceSpecificImageForName:(id)a3 screenHeight:(double)a4
{
  id v5 = a3;
  id v7 = (void *)AXAssistiveTouchIconTypeTypeToSiri;
  uint64_t v8 = AXUIAssistiveTouchImageNameForName(AXAssistiveTouchIconTypeTypeToSiri);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  unsigned int v10 = [v5 isEqualToString:v9];

  if (v10) {
    goto LABEL_15;
  }
  id HasStaccato = (id)AXDeviceHasStaccato(v11, v12);
  if ((_DWORD)HasStaccato)
  {
    id v7 = (void *)AXAssistiveTouchIconTypeActionButton;
    id HasStaccato = [v5 isEqualToString:AXAssistiveTouchIconTypeActionButton];
    if ((_DWORD)HasStaccato) {
      goto LABEL_15;
    }
  }

  uint64_t v15 = AXDeviceSupportsCameraButton(HasStaccato, v14);
  if ((_DWORD)v15)
  {
    id v7 = (void *)AXAssistiveTouchIconTypeCameraButton;
    uint64_t v17 = AXUIAssistiveTouchImageNameForName(AXAssistiveTouchIconTypeCameraButton);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned int v19 = [v5 isEqualToString:v18];

    if (v19) {
      goto LABEL_15;
    }
  }

  uint64_t v20 = AXDeviceSupportsCameraButton(v15, v16);
  if ((_DWORD)v20)
  {
    id v7 = (void *)AXAssistiveTouchIconTypeCameraButtonLightPress;
    uint64_t v22 = AXUIAssistiveTouchImageNameForName(AXAssistiveTouchIconTypeCameraButtonLightPress);
    CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v24 = [v5 isEqualToString:v23];

    if (v24) {
      goto LABEL_15;
    }
  }

  uint64_t v25 = AXDeviceSupportsCameraButton(v20, v21);
  if ((_DWORD)v25)
  {
    id v7 = (void *)AXAssistiveTouchIconTypeCameraButtonDoubleLightPress;
    uint64_t v27 = AXUIAssistiveTouchImageNameForName(AXAssistiveTouchIconTypeCameraButtonDoubleLightPress);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    unsigned int v29 = [v5 isEqualToString:v28];

    if (v29) {
      goto LABEL_15;
    }
  }

  if (AXDeviceSupportsCameraButton(v25, v26))
  {
    if (AXDeviceHasGreyMatterEnabled())
    {
      id v7 = (void *)AXAssistiveTouchIconTypeVisualIntelligence;
      uint64_t v30 = AXUIAssistiveTouchImageNameForName(AXAssistiveTouchIconTypeVisualIntelligence);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      unsigned int v32 = [v5 isEqualToString:v31];

      if (v32)
      {
LABEL_15:
        id v6 = v7;
        goto LABEL_16;
      }
    }
  }

  if ([v5 hasPrefix:@"system-image-"])
  {
LABEL_2:
    id v6 = v5;
LABEL_16:
    uint64_t v33 = AXUIAssistiveTouchImageForName(v6);
    id v34 = (id)objc_claimAutoreleasedReturnValue(v33);
    goto LABEL_17;
  }

  int IsPhoneIdiom = AXDeviceIsPhoneIdiom();
  if (a4 <= 480.0
    || !IsPhoneIdiom
    || (v37 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:@"-tall"]),
        id v34 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](&OBJC_CLASS___UIImage, "_deviceSpecificImageNamed:", v37)),
        v37,
        !v34))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](&OBJC_CLASS___UIImage, "_deviceSpecificImageNamed:", v5));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageByPreparingThumbnailOfSize:", 60.0, 60.0));
    uint64_t v40 = v39;
    if (v39)
    {
      id v34 = v39;
    }

    else
    {
      uint64_t v41 = objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  30.0));
      id v34 = (id)objc_claimAutoreleasedReturnValue([v38 imageByApplyingSymbolConfiguration:v41]);

      v38 = (void *)v41;
    }
  }

- (double)_screenHeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 _referenceBounds];
  double Height = CGRectGetHeight(v5);

  return Height;
}

- (UIImage)deviceSpecificImage
{
  imageName = self->_imageName;
  if (imageName)
  {
    -[HNDRockerButton _screenHeight](self, "_screenHeight");
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[HNDRockerButton _deviceSpecificImageForName:screenHeight:]( self,  "_deviceSpecificImageForName:screenHeight:",  imageName));
  }

  else
  {
    id v4 = 0LL;
  }

  return (UIImage *)v4;
}

- (void)updateTextColor
{
  if (self->_disabled)
  {
    label = self->_label;
    double v3 = 1.0;
    double v4 = 1.0;
    double v5 = 1.0;
    double v6 = 0.5;
  }

  else
  {
    if (self->_selected || self->_highlighted)
    {
      label = self->_label;
      double v3 = 0.250980392;
      double v4 = 0.670588235;
      double v5 = 0.992156863;
    }

    else
    {
      label = self->_label;
      double v3 = 1.0;
      double v4 = 1.0;
      double v5 = 1.0;
    }

    double v6 = 1.0;
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v3,  v4,  v5,  v6));
  -[UILabel setTextColor:](label, "setTextColor:", v7);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[HNDRockerButton updateTextColor](self, "updateTextColor");
    -[HNDRockerButton _updateImageView](self, "_updateImageView");
  }

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[HNDRockerButton updateTextColor](self, "updateTextColor");
    -[HNDRockerButton _updateImageView](self, "_updateImageView");
  }

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[HNDRockerButton updateTextColor](self, "updateTextColor");
    -[HNDRockerButton _updateImageView](self, "_updateImageView");
  }

- (void)setTitle:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[HNDRockerButton _updateLabelText](self, "_updateLabelText");
    double v5 = v6;
  }
}

- (void)_updateLabelText
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[HNDRockerButton title](self, "title"));
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    LODWORD(v6) = 981668463;
    -[NSMutableParagraphStyle setHyphenationFactor:](v5, "setHyphenationFactor:", v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssistiveTouchLayoutView fontMetrics](&OBJC_CLASS___AXAssistiveTouchLayoutView, "fontMetrics"));
    else {
      double v9 = 16.0;
    }
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssistiveTouchLayoutView traitCollectionForLabelPreferredContentSizeCategory]( &OBJC_CLASS___AXAssistiveTouchLayoutView,  "traitCollectionForLabelPreferredContentSizeCategory"));
    [v7 scaledValueForValue:v10 compatibleWithTraitCollection:v9];
    -[NSMutableParagraphStyle setMinimumLineHeight:](v5, "setMinimumLineHeight:");

    -[NSMutableParagraphStyle minimumLineHeight](v5, "minimumLineHeight");
    -[NSMutableParagraphStyle setMaximumLineHeight:](v5, "setMaximumLineHeight:");
    if ([v4 containsString:@"\\n"])
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]);

      double v4 = (void *)v11;
    }

    -[NSMutableParagraphStyle setAlignment:](v5, "setAlignment:", 1LL);
    -[NSMutableParagraphStyle setLineBreakMode:](v5, "setLineBreakMode:", 4LL);
    -[UILabel setText:](self->_label, "setText:", 0LL);
    uint64_t v12 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    NSAttributedStringKey v15 = NSParagraphStyleAttributeName;
    uint64_t v16 = v5;
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v14 = -[NSAttributedString initWithString:attributes:](v12, "initWithString:attributes:", v4, v13);

    -[UILabel setAttributedText:](self->_label, "setAttributedText:", v14);
  }

  else
  {
    -[UILabel setText:](self->_label, "setText:", 0LL);
  }

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HNDRockerButton;
  -[HNDRockerButton dealloc](&v4, "dealloc");
}

- (UIView)imageViewContainerView
{
  return (UIView *)self->_imageView;
}

- (BOOL)isAccessibilityElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text"));
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  label = self->_label;
  -[UIImageView accessibilityFrame](self->_imageView, "accessibilityFrame");
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (label)
  {
    -[UILabel accessibilityFrame](self->_label, "accessibilityFrame");
    v23.origin.CGFloat x = v12;
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v14;
    v23.size.CGFloat height = v15;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectUnion(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)accessibilityLabel
{
  if (-[HNDRockerButton isBackButton](self, "isBackButton"))
  {
    BOOL v3 = @"back.button";
  }

  else
  {
    if (!-[HNDRockerButton isEmptyFavorite](self, "isEmptyFavorite"))
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( self->_title,  "stringByReplacingOccurrencesOfString:withString:",  @"\n",  @" "));
      return v5;
    }

    BOOL v3 = @"empty.favorite.gesture.button";
  }

  id v4 = sub_10002B014(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return v5;
}

- (id)description
{
  *(void *)&double v3 = objc_opt_class(self, a2).n128_u64[0];
  uint64_t v5 = v4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text", v3));
  -[HNDRockerButton frame](self, "frame");
  id v7 = NSStringFromCGRect(v11);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ %p] - Label: %@ Frame: %@",  v5,  self,  v6,  v8));

  return v9;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (NSString)title
{
  return self->_title;
}

- (id)downBlock
{
  return self->_downBlock;
}

- (id)upBlock
{
  return self->_upBlock;
}

- (BOOL)isEmptyFavorite
{
  return self->isEmptyFavorite;
}

- (void)setIsEmptyFavorite:(BOOL)a3
{
  self->isEmptyFavorite = a3;
}

- (BOOL)customTitle
{
  return self->customTitle;
}

- (void)setCustomTitle:(BOOL)a3
{
  self->customTitle = a3;
}

- (BOOL)isModalDown
{
  return self->isModalDown;
}

- (void)setIsModalDown:(BOOL)a3
{
  self->isModalDown = a3;
}

- (BOOL)isBackButton
{
  return self->_isBackButton;
}

- (void)setIsBackButton:(BOOL)a3
{
  self->_isBackButton = a3;
}

- (BOOL)continueHighlightAfterTouch
{
  return self->_continueHighlightAfterTouch;
}

- (void)setContinueHighlightAfterTouch:(BOOL)a3
{
  self->_continueHighlightAfterTouch = a3;
}

- (BOOL)showWithGuidedAccess
{
  return self->_showWithGuidedAccess;
}

- (void)setShowWithGuidedAccess:(BOOL)a3
{
  self->_showWithGuidedAccess = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (id)substantialTransitionOccurredBlock
{
  return self->_substantialTransitionOccurredBlock;
}

- (void)setSubstantialTransitionOccurredBlock:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (HNDRockerButtonDataSource)dataSource
{
  return (HNDRockerButtonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (BOOL)showWithAssistiveAccess
{
  return self->_showWithAssistiveAccess;
}

- (void)setShowWithAssistiveAccess:(BOOL)a3
{
  self->_showWithAssistiveAccess = a3;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (UIImage)unselectedImage
{
  return self->_unselectedImage;
}

- (void)setUnselectedImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end