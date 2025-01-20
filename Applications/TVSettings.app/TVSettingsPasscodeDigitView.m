@interface TVSettingsPasscodeDigitView
- (BOOL)canBecomeFocused;
- (BOOL)showDigit;
- (NSArray)recognizers;
- (NSString)text;
- (TVSettingsHighlightView)highlight;
- (TVSettingsPasscodeDigitView)initWithFrame:(CGRect)a3;
- (TVSettingsPasscodeDigitViewDelegate)delegate;
- (UIImageView)bulletView;
- (UIImageView)downArrowView;
- (UIImageView)upArrowView;
- (UILabel)label;
- (UIView)clippingView;
- (double)fontSize;
- (double)highlightProgress;
- (id)arrowImage:(BOOL)a3;
- (id)hiddenDigitImage;
- (unint64_t)maxDigitValue;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)downGesture:(id)a3;
- (void)layoutSubviews;
- (void)setBulletView:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownArrowView:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setHighlight:(id)a3;
- (void)setHighlightProgress:(double)a3;
- (void)setLabel:(id)a3;
- (void)setMaxDigitValue:(unint64_t)a3;
- (void)setRecognizers:(id)a3;
- (void)setShowDigit:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUpArrowView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)upGesture:(id)a3;
@end

@implementation TVSettingsPasscodeDigitView

- (TVSettingsPasscodeDigitView)initWithFrame:(CGRect)a3
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___TVSettingsPasscodeDigitView;
  v3 = -[TVSettingsPasscodeDigitView initWithFrame:]( &v49,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showDigit = 1;
    v3->_fontSize = 100.0;
    v3->_maxDigitValue = 9LL;
    v5 = objc_alloc_init(&OBJC_CLASS___UIView);
    clippingView = v4->_clippingView;
    v4->_clippingView = v5;

    -[UIView setClipsToBounds:](v4->_clippingView, "setClipsToBounds:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_clippingView, "layer"));
    [v7 setCornerRadius:10.0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_clippingView, "layer"));
    [v8 setBorderWidth:4.0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_clippingView, "layer"));
    if (qword_1001E1B68 != -1) {
      dispatch_once(&qword_1001E1B68, &stru_100193DF8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 traitCollection]);
    id v12 = [v11 userInterfaceStyle];

    if (v12 == (id)2 || v12 == (id)1000) {
      v14 = &qword_1001E1B60;
    }
    else {
      v14 = &qword_1001E1B58;
    }
    objc_msgSend(v9, "setBorderColor:", objc_msgSend( (id) *v14, "CGColor"));

    -[TVSettingsPasscodeDigitView addSubview:](v4, "addSubview:", v4->_clippingView);
    v15 = objc_alloc_init(&OBJC_CLASS___TVSettingsHighlightView);
    highlight = v4->_highlight;
    v4->_highlight = v15;

    -[UIView addSubview:](v4->_clippingView, "addSubview:", v4->_highlight);
    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v4->_label;
    v4->_label = v17;

    -[UILabel setOpaque:](v4->_label, "setOpaque:", 0LL);
    v19 = v4->_label;
    if (qword_1001E1B68 != -1) {
      dispatch_once(&qword_1001E1B68, &stru_100193DF8);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 traitCollection]);
    id v22 = [v21 userInterfaceStyle];

    if (v22 == (id)2 || v22 == (id)1000) {
      v24 = &qword_1001E1B60;
    }
    else {
      v24 = &qword_1001E1B58;
    }
    -[UILabel setTextColor:](v19, "setTextColor:", *v24);
    v25 = v4->_label;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v25, "setBackgroundColor:", v26);

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1LL);
    v27 = v4->_label;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 fontWithSize:v4->_fontSize]);
    -[UILabel setFont:](v27, "setFont:", v29);

    -[UIView addSubview:](v4->_clippingView, "addSubview:", v4->_label);
    v30 = objc_alloc(&OBJC_CLASS___UIImageView);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView hiddenDigitImage](v4, "hiddenDigitImage"));
    v32 = -[UIImageView initWithImage:](v30, "initWithImage:", v31);
    bulletView = v4->_bulletView;
    v4->_bulletView = v32;

    -[UIImageView setHidden:](v4->_bulletView, "setHidden:", 1LL);
    -[TVSettingsPasscodeDigitView addSubview:](v4, "addSubview:", v4->_bulletView);
    v34 = objc_alloc(&OBJC_CLASS___UIImageView);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView arrowImage:](v4, "arrowImage:", 1LL));
    v36 = -[UIImageView initWithImage:](v34, "initWithImage:", v35);
    upArrowView = v4->_upArrowView;
    v4->_upArrowView = v36;

    -[UIImageView setAlpha:](v4->_upArrowView, "setAlpha:", 0.0);
    -[TVSettingsPasscodeDigitView addSubview:](v4, "addSubview:", v4->_upArrowView);
    v38 = objc_alloc(&OBJC_CLASS___UIImageView);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView arrowImage:](v4, "arrowImage:", 0LL));
    v40 = -[UIImageView initWithImage:](v38, "initWithImage:", v39);
    downArrowView = v4->_downArrowView;
    v4->_downArrowView = v40;

    -[UIImageView setAlpha:](v4->_downArrowView, "setAlpha:", 0.0);
    -[TVSettingsPasscodeDigitView addSubview:](v4, "addSubview:", v4->_downArrowView);
    v42 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "upGesture:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v42, "setAllowedPressTypes:", &off_1001AF250);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v42, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[TVSettingsPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v42);
    v43 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "upGesture:");
    -[UISwipeGestureRecognizer setDirection:](v43, "setDirection:", 4LL);
    -[TVSettingsPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v43);
    v44 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "downGesture:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v44, "setAllowedPressTypes:", &off_1001AF268);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v44, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[TVSettingsPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v44);
    v45 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "downGesture:");
    -[UISwipeGestureRecognizer setDirection:](v45, "setDirection:", 8LL);
    -[TVSettingsPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v45);
    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v42, v43, v44, v45, 0LL));
    recognizers = v4->_recognizers;
    v4->_recognizers = (NSArray *)v46;
  }

  return v4;
}

- (void)layoutSubviews
{
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  double v7 = round((CGRectGetWidth(v22) + -20.0) * 0.5);
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double MinY = CGRectGetMinY(v23);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  double v9 = round((CGRectGetWidth(v24) + -20.0) * 0.5);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  CGFloat v10 = CGRectGetMaxY(v25) + -20.0;
  -[UIImageView setFrame:](self->_upArrowView, "setFrame:", v7, MinY, 20.0, 20.0);
  -[UIImageView setFrame:](self->_downArrowView, "setFrame:", v9, v10, 20.0, 20.0);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  double MinX = CGRectGetMinX(v26);
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  CGFloat v12 = CGRectGetMinY(v27) + 20.0 + 10.0;
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  double v13 = CGRectGetWidth(v28);
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  -[UIView setFrame:](self->_clippingView, "setFrame:", MinX, v12, v13, CGRectGetHeight(v29) + -60.0);
  highlight = self->_highlight;
  -[UIView bounds](self->_clippingView, "bounds");
  -[TVSettingsHighlightView setFrame:](highlight, "setFrame:");
  label = self->_label;
  -[UIView bounds](self->_clippingView, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
  id v16 = -[UIImageView frame](self->_bulletView, "frame");
  UIRectCenteredIntegralRect(v16, v17, v18, v19, v20, x, y, width, height);
  -[UIImageView setFrame:](self->_bulletView, "setFrame:");
  BOOL showDigit = self->_showDigit;
  -[UILabel setHidden:](self->_label, "setHidden:", !self->_showDigit);
  -[UIImageView setHidden:](self->_bulletView, "setHidden:", showDigit);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsPasscodeDigitView;
  -[TVSettingsPasscodeDigitView didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  unsigned int v5 = -[TVSettingsPasscodeDigitView isFocused](self, "isFocused");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v7 = WeakRetained;
  if (v5)
  {
    double v8 = 1.0;
    if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitViewDidBecomeFocused:") & 1) != 0) {
      [v7 passcodeDigitViewDidBecomeFocused:self];
    }
  }

  else
  {
    double v8 = 0.0;
    if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitViewDidResignFocus:") & 1) != 0) {
      [v7 passcodeDigitViewDidResignFocus:self];
    }
  }

  -[TVSettingsHighlightView setAlpha:](self->_highlight, "setAlpha:", v8);
  -[UIImageView setAlpha:](self->_upArrowView, "setAlpha:", v8);
  -[UIImageView setAlpha:](self->_downArrowView, "setAlpha:", v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVSettingsPasscodeDigitView;
  -[TVSettingsPasscodeDigitView traitCollectionDidChange:](&v26, "traitCollectionDidChange:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 traitCollection]);
  id v7 = [v6 userInterfaceStyle];

  if (v7 && [v4 userInterfaceStyle] != v7)
  {
    upArrowView = self->_upArrowView;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView arrowImage:](self, "arrowImage:", 1LL));
    -[UIImageView setImage:](upArrowView, "setImage:", v9);

    downArrowView = self->_downArrowView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView arrowImage:](self, "arrowImage:", 0LL));
    -[UIImageView setImage:](downArrowView, "setImage:", v11);

    label = self->_label;
    if (qword_1001E1B68 != -1) {
      dispatch_once(&qword_1001E1B68, &stru_100193DF8);
    }
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 traitCollection]);
    id v15 = [v14 userInterfaceStyle];

    if (v15 == (id)2 || v15 == (id)1000) {
      double v17 = &qword_1001E1B60;
    }
    else {
      double v17 = &qword_1001E1B58;
    }
    -[UILabel setTextColor:](label, "setTextColor:", *v17);
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_clippingView, "layer"));
    if (qword_1001E1B68 != -1) {
      dispatch_once(&qword_1001E1B68, &stru_100193DF8);
    }
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 traitCollection]);
    id v21 = [v20 userInterfaceStyle];

    if (v21 == (id)2 || v21 == (id)1000) {
      CGRect v23 = &qword_1001E1B60;
    }
    else {
      CGRect v23 = &qword_1001E1B58;
    }
    objc_msgSend(v18, "setBorderColor:", objc_msgSend( (id) *v23, "CGColor"));

    bulletView = self->_bulletView;
    CGRect v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView hiddenDigitImage](self, "hiddenDigitImage"));
    -[UIImageView setImage:](bulletView, "setImage:", v25);
  }
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setShowDigit:(BOOL)a3
{
  if (self->_showDigit != a3)
  {
    self->_BOOL showDigit = a3;
    -[TVSettingsPasscodeDigitView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)upGesture:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text", a3));
  id v5 = [v4 integerValue];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  ((unint64_t)v5 + 1) % (self->_maxDigitValue + 1)));
  -[TVSettingsPasscodeDigitView setText:](self, "setText:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitView:didChangeText:") & 1) != 0) {
    [WeakRetained passcodeDigitView:self didChangeText:v7];
  }
}

- (void)downGesture:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text", a3));
  id v5 = [v4 integerValue];

  if (v5) {
    unint64_t maxDigitValue = ((uint64_t)v5 - 1) % (self->_maxDigitValue + 1);
  }
  else {
    unint64_t maxDigitValue = self->_maxDigitValue;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", maxDigitValue));
  -[TVSettingsPasscodeDigitView setText:](self, "setText:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitView:didChangeText:") & 1) != 0) {
    [WeakRetained passcodeDigitView:self didChangeText:v8];
  }
}

- (id)arrowImage:(BOOL)a3
{
  BOOL v3 = a3;
  v33.origin.CGFloat x = 0.0;
  v33.origin.CGFloat y = 0.0;
  v33.size.CGFloat width = 20.0;
  v33.size.CGFloat height = 20.0;
  CGRect v34 = CGRectInset(v33, 2.0, 2.0);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView window](self, "window"));
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue([v9 screen]);
  [v10 scale];
  CGFloat v12 = v11;
  v32.CGFloat width = 20.0;
  v32.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v32, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 4.0);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinMiter);
  CGContextSetLineCap(CurrentContext, kCGLineCapButt);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v36);
  CGContextMoveToPoint(CurrentContext, MinX, MidY);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v37);
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;
  if (v3) {
    double MinY = CGRectGetMinY(*(CGRect *)&v17);
  }
  else {
    double MinY = CGRectGetMaxY(*(CGRect *)&v17);
  }
  CGContextAddLineToPoint(CurrentContext, MidX, MinY);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGFloat v23 = CGRectGetMidY(v39);
  CGContextAddLineToPoint(CurrentContext, MaxX, v23);
  if (qword_1001E1B68 != -1) {
    dispatch_once(&qword_1001E1B68, &stru_100193DF8);
  }
  CGRect v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  CGRect v25 = (void *)objc_claimAutoreleasedReturnValue([v24 traitCollection]);
  id v26 = [v25 userInterfaceStyle];

  BOOL v27 = v26 == (id)2 || v26 == (id)1000;
  CGRect v28 = &qword_1001E1B60;
  if (!v27) {
    CGRect v28 = &qword_1001E1B58;
  }
  CGContextSetStrokeColorWithColor( CurrentContext, (CGColorRef)[(id) *v28 CGColor]);
  CGContextStrokePath(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v30;
}

- (id)hiddenDigitImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPasscodeDigitView window](self, "window"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 screen]);
  [v3 scale];
  CGFloat v5 = v4;
  v15.CGFloat width = 20.0;
  v15.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v5);

  CurrentContext = UIGraphicsGetCurrentContext();
  if (qword_1001E1B68 != -1) {
    dispatch_once(&qword_1001E1B68, &stru_100193DF8);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 traitCollection]);
  id v9 = [v8 userInterfaceStyle];

  BOOL v10 = v9 == (id)2 || v9 == (id)1000;
  double v11 = &qword_1001E1B60;
  if (!v10) {
    double v11 = &qword_1001E1B58;
  }
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[(id) *v11 CGColor]);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.CGFloat width = 20.0;
  v16.size.CGFloat height = 20.0;
  CGContextFillEllipseInRect(CurrentContext, v16);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  double v13 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v13;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
  label = self->_label;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fontWithSize:self->_fontSize]);
  -[UILabel setFont:](label, "setFont:", v6);

  -[TVSettingsPasscodeDigitView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMaxDigitValue:(unint64_t)a3
{
  unint64_t v4 = 9LL;
  if (a3 < 9) {
    unint64_t v4 = a3;
  }
  self->_unint64_t maxDigitValue = v4;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text"));
  id v6 = [v5 integerValue];

  if ((unint64_t)v6 > self->_maxDigitValue)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", 0LL));
    -[TVSettingsPasscodeDigitView setText:](self, "setText:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitView:didChangeText:") & 1) != 0) {
      [WeakRetained passcodeDigitView:self didChangeText:v8];
    }
  }

- (double)fontSize
{
  return self->_fontSize;
}

- (unint64_t)maxDigitValue
{
  return self->_maxDigitValue;
}

- (BOOL)showDigit
{
  return self->_showDigit;
}

- (TVSettingsPasscodeDigitViewDelegate)delegate
{
  return (TVSettingsPasscodeDigitViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)highlightProgress
{
  return self->_highlightProgress;
}

- (void)setHighlightProgress:(double)a3
{
  self->_highlightProgress = a3;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (TVSettingsHighlightView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (UIImageView)bulletView
{
  return self->_bulletView;
}

- (void)setBulletView:(id)a3
{
}

- (UIImageView)upArrowView
{
  return self->_upArrowView;
}

- (void)setUpArrowView:(id)a3
{
}

- (UIImageView)downArrowView
{
  return self->_downArrowView;
}

- (void)setDownArrowView:(id)a3
{
}

- (NSArray)recognizers
{
  return self->_recognizers;
}

- (void)setRecognizers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end