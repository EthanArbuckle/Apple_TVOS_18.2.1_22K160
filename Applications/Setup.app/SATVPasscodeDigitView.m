@interface SATVPasscodeDigitView
- (BOOL)canBecomeFocused;
- (BOOL)showDigit;
- (NSArray)recognizers;
- (NSString)text;
- (SATVHighlightView)highlight;
- (SATVPasscodeDigitView)initWithFrame:(CGRect)a3;
- (SATVPasscodeDigitViewDelegate)delegate;
- (UIImageView)bulletView;
- (UIImageView)downArrowView;
- (UIImageView)upArrowView;
- (UILabel)label;
- (UIView)clippingView;
- (double)fontSize;
- (id)_labelFont;
- (id)arrowImage:(BOOL)a3;
- (id)hiddenDigitImage;
- (int64_t)maxDigitValue;
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
- (void)setMaxDigitValue:(int64_t)a3;
- (void)setRecognizers:(id)a3;
- (void)setShowDigit:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUpArrowView:(id)a3;
- (void)upGesture:(id)a3;
@end

@implementation SATVPasscodeDigitView

- (SATVPasscodeDigitView)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___SATVPasscodeDigitView;
  v3 = -[SATVPasscodeDigitView initWithFrame:]( &v40,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
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
    id v10 = objc_claimAutoreleasedReturnValue( +[UIColor tvsk_opacityADynamicColor]( &OBJC_CLASS___UIColor, "tvsk_opacityADynamicColor"));
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    -[SATVPasscodeDigitView addSubview:](v4, "addSubview:", v4->_clippingView);
    v11 = objc_alloc_init(&OBJC_CLASS___SATVHighlightView);
    highlight = v4->_highlight;
    v4->_highlight = v11;

    -[UIView addSubview:](v4->_clippingView, "addSubview:", v4->_highlight);
    v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
    label = v4->_label;
    v4->_label = v13;

    -[UILabel setOpaque:](v4->_label, "setOpaque:", 0LL);
    v15 = v4->_label;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityADynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityADynamicColor"));
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = v4->_label;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1LL);
    v19 = v4->_label;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView _labelFont](v4, "_labelFont"));
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UIView addSubview:](v4->_clippingView, "addSubview:", v4->_label);
    v21 = objc_alloc(&OBJC_CLASS___UIImageView);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView hiddenDigitImage](v4, "hiddenDigitImage"));
    v23 = -[UIImageView initWithImage:](v21, "initWithImage:", v22);
    bulletView = v4->_bulletView;
    v4->_bulletView = v23;

    -[UIImageView setHidden:](v4->_bulletView, "setHidden:", 1LL);
    -[SATVPasscodeDigitView addSubview:](v4, "addSubview:", v4->_bulletView);
    v25 = objc_alloc(&OBJC_CLASS___UIImageView);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView arrowImage:](v4, "arrowImage:", 1LL));
    v27 = -[UIImageView initWithImage:](v25, "initWithImage:", v26);
    upArrowView = v4->_upArrowView;
    v4->_upArrowView = v27;

    -[UIImageView setAlpha:](v4->_upArrowView, "setAlpha:", 0.0);
    -[SATVPasscodeDigitView addSubview:](v4, "addSubview:", v4->_upArrowView);
    v29 = objc_alloc(&OBJC_CLASS___UIImageView);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView arrowImage:](v4, "arrowImage:", 0LL));
    v31 = -[UIImageView initWithImage:](v29, "initWithImage:", v30);
    downArrowView = v4->_downArrowView;
    v4->_downArrowView = v31;

    -[UIImageView setAlpha:](v4->_downArrowView, "setAlpha:", 0.0);
    -[SATVPasscodeDigitView addSubview:](v4, "addSubview:", v4->_downArrowView);
    v33 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "upGesture:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v33, "setAllowedPressTypes:", &off_1000D1010);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v33, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[SATVPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v33);
    v34 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "upGesture:");
    -[UISwipeGestureRecognizer setDirection:](v34, "setDirection:", 4LL);
    -[SATVPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v34);
    v35 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v4,  "downGesture:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v35, "setAllowedPressTypes:", &off_1000D1028);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v35, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[SATVPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v35);
    v36 = -[UISwipeGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UISwipeGestureRecognizer),  "initWithTarget:action:",  v4,  "downGesture:");
    -[UISwipeGestureRecognizer setDirection:](v36, "setDirection:", 8LL);
    -[SATVPasscodeDigitView addGestureRecognizer:](v4, "addGestureRecognizer:", v36);
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v33, v34, v35, v36, 0LL));
    recognizers = v4->_recognizers;
    v4->_recognizers = (NSArray *)v37;
  }

  return v4;
}

- (void)layoutSubviews
{
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  double v7 = round((CGRectGetWidth(v21) + -20.0) * 0.5);
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double v9 = round((CGRectGetWidth(v23) + -20.0) * 0.5);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  CGFloat v10 = CGRectGetMaxY(v24) + -20.0;
  -[UIImageView setFrame:](self->_upArrowView, "setFrame:", v7, MinY, 20.0, 20.0);
  -[UIImageView setFrame:](self->_downArrowView, "setFrame:", v9, v10, 20.0, 20.0);
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  CGFloat v12 = CGRectGetMinY(v26) + 20.0 + 10.0;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  double v13 = CGRectGetWidth(v27);
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  -[UIView setFrame:](self->_clippingView, "setFrame:", MinX, v12, v13, CGRectGetHeight(v28) + -60.0);
  highlight = self->_highlight;
  -[UIView bounds](self->_clippingView, "bounds");
  -[SATVHighlightView setFrame:](highlight, "setFrame:");
  label = self->_label;
  -[UIView bounds](self->_clippingView, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
  -[UIImageView frame](self->_bulletView, "frame");
  -[UIImageView setFrame:]( self->_bulletView,  "setFrame:",  UIRectCenteredIntegralRect(v16, v17, v18, v19, x, y, width, height));
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
  v9.super_class = (Class)&OBJC_CLASS___SATVPasscodeDigitView;
  -[SATVPasscodeDigitView didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  unsigned int v5 = -[SATVPasscodeDigitView isFocused](self, "isFocused");
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

  -[SATVHighlightView setAlpha:](self->_highlight, "setAlpha:", v8);
  -[UIImageView setAlpha:](self->_upArrowView, "setAlpha:", v8);
  -[UIImageView setAlpha:](self->_downArrowView, "setAlpha:", v8);
}

- (void)setHighlightProgress:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVPasscodeDigitView;
  -[SATVPasscodeDigitView setHighlightProgress:](&v7, "setHighlightProgress:");
  -[SATVHighlightView setHighlightProgress:](self->_highlight, "setHighlightProgress:", a3);
  -[SATVPasscodeDigitView primaryHighlightAlphaForHighlightProgress:]( self,  "primaryHighlightAlphaForHighlightProgress:",  a3);
  double v6 = v5;
  -[UIImageView setAlpha:](self->_upArrowView, "setAlpha:");
  -[UIImageView setAlpha:](self->_downArrowView, "setAlpha:", v6);
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
    -[SATVPasscodeDigitView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)upGesture:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text", a3));
  id v5 = [v4 integerValue];

  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  ((uint64_t)v5 + 1) % (self->_maxDigitValue + 1)));
  -[SATVPasscodeDigitView setText:](self, "setText:");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "passcodeDigitView:didChangeText:") & 1) != 0) {
    [v6 passcodeDigitView:self didChangeText:v7];
  }
}

- (void)downGesture:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text", a3));
  id v5 = [v4 integerValue];

  if (v5) {
    uint64_t maxDigitValue = ((uint64_t)v5 - 1) % (self->_maxDigitValue + 1);
  }
  else {
    uint64_t maxDigitValue = self->_maxDigitValue;
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", maxDigitValue));
  -[SATVPasscodeDigitView setText:](self, "setText:");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "passcodeDigitView:didChangeText:") & 1) != 0) {
    [v7 passcodeDigitView:self didChangeText:v8];
  }
}

- (id)arrowImage:(BOOL)a3
{
  BOOL v3 = a3;
  v29.origin.CGFloat x = 0.0;
  v29.origin.CGFloat y = 0.0;
  v29.size.CGFloat width = 20.0;
  v29.size.CGFloat height = 20.0;
  CGRect v30 = CGRectInset(v29, 2.0, 2.0);
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView window](self, "window"));
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue([v9 screen]);
  [v10 scale];
  CGFloat v12 = v11;
  v28.CGFloat width = 20.0;
  v28.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v12);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 4.0);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinMiter);
  CGContextSetLineCap(CurrentContext, kCGLineCapButt);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v32);
  CGContextMoveToPoint(CurrentContext, MinX, MidY);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v33);
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
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v23 = CGRectGetMidY(v35);
  CGContextAddLineToPoint(CurrentContext, MaxX, v23);
  id v24 = objc_claimAutoreleasedReturnValue( +[UIColor tvsk_opacityADynamicColor]( &OBJC_CLASS___UIColor, "tvsk_opacityADynamicColor"));
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v24 CGColor]);

  CGContextStrokePath(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  CGRect v26 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v26;
}

- (id)hiddenDigitImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView window](self, "window"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 screen]);
  [v3 scale];
  CGFloat v5 = v4;
  v11.CGFloat width = 20.0;
  v11.CGFloat height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v11, 0, v5);

  CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = objc_claimAutoreleasedReturnValue( +[UIColor tvsk_opacityADynamicColor]( &OBJC_CLASS___UIColor, "tvsk_opacityADynamicColor"));
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);

  v12.origin.CGFloat x = 0.0;
  v12.origin.CGFloat y = 0.0;
  v12.size.CGFloat width = 20.0;
  v12.size.CGFloat height = 20.0;
  CGContextFillEllipseInRect(CurrentContext, v12);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v9;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
  label = self->_label;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPasscodeDigitView _labelFont](self, "_labelFont"));
  -[UILabel setFont:](label, "setFont:", v5);

  -[SATVPasscodeDigitView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMaxDigitValue:(int64_t)a3
{
  int64_t v4 = 9LL;
  if (a3 < 9) {
    int64_t v4 = a3;
  }
  self->_uint64_t maxDigitValue = v4;
  CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text"));
  id v6 = [v5 integerValue];

  if ((uint64_t)v6 > self->_maxDigitValue)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", 0LL));
    -[SATVPasscodeDigitView setText:](self, "setText:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector(WeakRetained, "passcodeDigitView:didChangeText:") & 1) != 0) {
      [WeakRetained passcodeDigitView:self didChangeText:v8];
    }
  }

- (id)_labelFont
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleTitle2));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fontWithSize:self->_fontSize]);

  return v4;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (int64_t)maxDigitValue
{
  return self->_maxDigitValue;
}

- (BOOL)showDigit
{
  return self->_showDigit;
}

- (SATVPasscodeDigitViewDelegate)delegate
{
  return (SATVPasscodeDigitViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
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

- (SATVHighlightView)highlight
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