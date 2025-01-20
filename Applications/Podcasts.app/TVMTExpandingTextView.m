@interface TVMTExpandingTextView
+ (double)cornerRadius;
- (AMPLanguageAwareString)languageAwareString;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isTextTruncating;
- (BOOL)moreLabelOnNewLine;
- (BOOL)needsTextSizeComputation;
- (BOOL)trackHorizontal;
- (CGRect)_moreLabelFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)descriptionText;
- (TVMTExpandingTextView)initWithFrame:(CGRect)a3;
- (UIColor)descriptionTextColor;
- (UIColor)descriptionTextHighlightColor;
- (UIColor)highlightBackgroundColor;
- (UILabel)moreLabel;
- (UITapGestureRecognizer)playRecognizer;
- (UITapGestureRecognizer)selectRecognizer;
- (UITextView)descriptionTextView;
- (UIVisualEffectView)backgroundView;
- (_UIFloatingContentView)floatingView;
- (double)moreHighlightPadding;
- (id)_moreLabelExclusionPath;
- (id)playHandler;
- (id)selectionHandler;
- (unint64_t)maximumNumberOfLines;
- (void)_playButtonAction:(id)a3;
- (void)_recomputeTextSizeIfNeeded;
- (void)_selectButtonAction:(id)a3;
- (void)_setNeedsTextSizeComputation;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextColor:(id)a3;
- (void)setDescriptionTextHighlightColor:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setFloatingView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setLanguageAwareString:(id)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMoreHighlightPadding:(double)a3;
- (void)setMoreLabel:(id)a3;
- (void)setMoreLabelOnNewLine:(BOOL)a3;
- (void)setNeedsTextSizeComputation:(BOOL)a3;
- (void)setPlayHandler:(id)a3;
- (void)setPlayRecognizer:(id)a3;
- (void)setSelectRecognizer:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSelectionHandler:(id)a3;
- (void)setTrackHorizontal:(BOOL)a3;
- (void)updateLabelsTextColorForFocused:(BOOL)a3;
@end

@implementation TVMTExpandingTextView

- (TVMTExpandingTextView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___TVMTExpandingTextView;
  v7 = -[TVMTExpandingTextView initWithFrame:](&v43, "initWithFrame:");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMTExpandingTextView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = -[_UIFloatingContentView initWithFrame:]( objc_alloc(&OBJC_CLASS____UIFloatingContentView),  "initWithFrame:",  x,  y,  width,  height);
    floatingView = v7->_floatingView;
    v7->_floatingView = v9;

    -[_UIFloatingContentView setBackgroundColor:forState:](v7->_floatingView, "setBackgroundColor:forState:", 0LL, 0LL);
    -[_UIFloatingContentView setBackgroundColor:forState:](v7->_floatingView, "setBackgroundColor:forState:", 0LL, 8LL);
    -[_UIFloatingContentView setBackgroundColor:forState:](v7->_floatingView, "setBackgroundColor:forState:", 0LL, 1LL);
    -[_UIFloatingContentView setBackgroundColor:forState:](v7->_floatingView, "setBackgroundColor:forState:", 0LL, 4LL);
    -[_UIFloatingContentView setFloatingContentDelegate:](v7->_floatingView, "setFloatingContentDelegate:", v7);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v7->_floatingView,  "setContentMotionRotation:translation:",  0.0,  0.04,  0.0,  4.0);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v7->_floatingView, "setFocusedSizeIncrease:", 20.0);
    v11 = v7->_floatingView;
    [(id)objc_opt_class(v7) cornerRadius];
    -[_UIFloatingContentView setCornerRadius:](v11, "setCornerRadius:");
    -[TVMTExpandingTextView addSubview:](v7, "addSubview:", v7->_floatingView);
    v7->_moreHighlightPadding = 14.0;
    v12 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4011LL));
    v14 = -[UIVisualEffectView initWithEffect:](v12, "initWithEffect:", v13);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v14;

    -[UIVisualEffectView setAlpha:](v7->_backgroundView, "setAlpha:", 0.0);
    v16 = v7->_backgroundView;
    [(id)objc_opt_class(v7) cornerRadius];
    -[UIVisualEffectView _setCornerRadius:](v16, "_setCornerRadius:");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView visualEffectContainerView](v7->_floatingView, "visualEffectContainerView"));
    [v17 addSubview:v7->_backgroundView];

    v18 = objc_alloc(&OBJC_CLASS___UITextView);
    double v19 = CGRectZero.origin.y;
    double v20 = CGRectZero.size.width;
    double v21 = CGRectZero.size.height;
    v22 = -[UITextView initWithFrame:](v18, "initWithFrame:", CGRectZero.origin.x, v19, v20, v21);
    descriptionTextView = v7->_descriptionTextView;
    v7->_descriptionTextView = v22;

    -[UITextView setBackgroundColor:](v7->_descriptionTextView, "setBackgroundColor:", 0LL);
    -[UITextView setTextContainerInset:](v7->_descriptionTextView, "setTextContainerInset:", 0.0, -5.0, 0.0, -5.0);
    -[UITextView setScrollEnabled:](v7->_descriptionTextView, "setScrollEnabled:", 0LL);
    -[UITextView setEditable:](v7->_descriptionTextView, "setEditable:", 0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView layer](v7->_descriptionTextView, "layer"));
    [v24 setCornerRadius:0.0];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](v7->_descriptionTextView, "textContainer"));
    [v25 setMaximumNumberOfLines:0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](v7->_descriptionTextView, "textContainer"));
    [v26 setLineBreakMode:4];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v7->_floatingView, "contentView"));
    [v27 addSubview:v7->_descriptionTextView];

    v28 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  v19,  v20,  v21);
    moreLabel = v7->_moreLabel;
    v7->_moreLabel = v28;

    v30 = v7->_moreLabel;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 localizedStringForKey:@"more" value:&stru_100248948 table:0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedUppercaseString]);
    -[UILabel setText:](v30, "setText:", v33);

    v34 = v7->_moreLabel;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubhead));
    -[UILabel setFont:](v34, "setFont:", v35);

    -[UILabel sizeToFit](v7->_moreLabel, "sizeToFit");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v7->_floatingView, "contentView"));
    [v36 addSubview:v7->_moreLabel];

    v37 = v7->_moreLabel;
    -[TVMTExpandingTextView _moreLabelFrame](v7, "_moreLabelFrame");
    -[UILabel setFrame:](v37, "setFrame:");
    v38 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v7,  "_selectButtonAction:");
    selectRecognizer = v7->_selectRecognizer;
    v7->_selectRecognizer = v38;

    -[UITapGestureRecognizer setAllowedPressTypes:](v7->_selectRecognizer, "setAllowedPressTypes:", &off_1002552A8);
    -[TVMTExpandingTextView addGestureRecognizer:](v7, "addGestureRecognizer:", v7->_selectRecognizer);
    v40 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v7,  "_playButtonAction:");
    playRecognizer = v7->_playRecognizer;
    v7->_playRecognizer = v40;

    -[UITapGestureRecognizer setAllowedPressTypes:](v7->_playRecognizer, "setAllowedPressTypes:", &off_1002552C0);
    -[UITapGestureRecognizer setDelegate:](v7->_playRecognizer, "setDelegate:", v7);
    -[TVMTExpandingTextView addGestureRecognizer:](v7, "addGestureRecognizer:", v7->_playRecognizer);
  }

  return v7;
}

- (void)setHighlightBackgroundColor:(id)a3
{
  p_highlightBackgroundColor = &self->_highlightBackgroundColor;
  v7 = (UIColor *)a3;
  if (*p_highlightBackgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
    if (*p_highlightBackgroundColor)
    {
      -[_UIFloatingContentView setBackgroundColor:forState:]( self->_floatingView,  "setBackgroundColor:forState:",  *p_highlightBackgroundColor,  8LL);
      -[_UIFloatingContentView setBackgroundColor:forState:]( self->_floatingView,  "setBackgroundColor:forState:",  *p_highlightBackgroundColor,  1LL);
      -[UIVisualEffectView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
      backgroundView = self->_backgroundView;
      self->_backgroundView = 0LL;
    }
  }
}

- (void)updateLabelsTextColorForFocused:(BOOL)a3
{
  descriptionTextColor = self->_descriptionTextColor;
  if (descriptionTextColor && self->_descriptionTextHighlightColor)
  {
    if (a3) {
      descriptionTextColor = self->_descriptionTextHighlightColor;
    }
    descriptionTextView = self->_descriptionTextView;
    v6 = descriptionTextColor;
    -[UITextView setTextColor:](descriptionTextView, "setTextColor:", v6);
    moreLabel = self->_moreLabel;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[UIColor colorWithAlphaComponent:](v6, "colorWithAlphaComponent:", 0.5));
    -[UILabel setTextColor:](moreLabel, "setTextColor:", v8);
  }

- (void)setDescriptionTextColor:(id)a3
{
}

- (void)setDescriptionTextHighlightColor:(id)a3
{
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double moreHighlightPadding = self->_moreHighlightPadding;
  CGFloat v8 = moreHighlightPadding + -6.0;
  double v9 = moreHighlightPadding + -3.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
  [v10 setExclusionPaths:&__NSArray0__struct];

  -[TVMTExpandingTextView sizeThatFits:](self, "sizeThatFits:", v4, v6);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v15 = self->_moreHighlightPadding;
  -[UITextView setFrame:](self->_descriptionTextView, "setFrame:", v15, v8, v11, v13);
  double v16 = -self->_moreHighlightPadding;
  v27.origin.double x = v15;
  v27.origin.double y = v8;
  v27.size.double width = v12;
  v27.size.double height = v14;
  CGFloat v17 = CGRectGetWidth(v27) + self->_moreHighlightPadding * 2.0;
  v28.origin.double x = v15;
  v28.origin.double y = v8;
  v28.size.double width = v12;
  v28.size.double height = v14;
  CGFloat v18 = v8 + v9 + CGRectGetHeight(v28);
  -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", v16, -v8, v17, v18);
  -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", CGPointZero.x, CGPointZero.y, v17, v18);
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](self->_floatingView, "contentView"));
  [v19 addSubview:self->_moreLabel];

  moreLabel = self->_moreLabel;
  -[TVMTExpandingTextView _moreLabelFrame](self, "_moreLabelFrame");
  -[UILabel setFrame:](moreLabel, "setFrame:");
  -[TVMTExpandingTextView _recomputeTextSizeIfNeeded](self, "_recomputeTextSizeIfNeeded");
  double v21 = self->_moreLabel;
  if (self->_textTruncating)
  {
    -[UILabel setHidden:](v21, "setHidden:", 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTExpandingTextView _moreLabelExclusionPath](self, "_moreLabelExclusionPath"));
    v26 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    [v22 setExclusionPaths:v24];
  }

  else
  {
    -[UILabel setHidden:](v21, "setHidden:", 1LL);
    id v25 = (id)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
    [v25 setExclusionPaths:&__NSArray0__struct];
  }

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  if (a5)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000EB948;
    v5[3] = &unk_100244798;
    v5[4] = self;
    BOOL v6 = a3;
    BOOL v7 = a4;
    [a5 addCoordinatedAnimations:v5 completion:0];
  }

  else
  {
    -[TVMTExpandingTextView setSelected:animated:](self, "setSelected:animated:", a3, a4);
  }

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[TVMTExpandingTextView updateLabelsTextColorForFocused:](self, "updateLabelsTextColorForFocused:");
  if (v5) {
    uint64_t v7 = 8LL;
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", v7, v4);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMTExpandingTextView;
  id v6 = a4;
  id v7 = a3;
  -[TVMTExpandingTextView didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedView", v11.receiver, v11.super_class));

  id v9 = [v8 isDescendantOfView:self];
  -[TVMTExpandingTextView updateLabelsTextColorForFocused:](self, "updateLabelsTextColorForFocused:", v9);
  if ((_DWORD)v9) {
    uint64_t v10 = 8LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:]( self->_floatingView,  "setControlState:withAnimationCoordinator:",  v10,  v6);
}

- (BOOL)canBecomeFocused
{
  return -[TVMTExpandingTextView isTextTruncating](self, "isTextTruncating");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UITextView sizeThatFits:](self->_descriptionTextView, "sizeThatFits:");
  double v8 = v7;
  if (fabs(width) <= 2.22044605e-16) {
    double v9 = v6;
  }
  else {
    double v9 = width;
  }
  if (height > 0.0 && v7 > height && width > 0.0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView attributedText](self->_descriptionTextView, "attributedText"));
    [v13 boundingRectWithWidth:1 lines:v9];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v24.origin.double x = v15;
    v24.origin.double y = v17;
    v24.size.double width = v19;
    v24.size.double height = v21;
    double v22 = CGRectGetHeight(v24);
    if (v22 > 0.0) {
      double v8 = ceil(v22 * floor(height / v22));
    }
  }

  double v11 = v9;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TVMTExpandingTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMTExpandingTextView;
  -[TVMTExpandingTextView setFrame:](&v8, "setFrame:", x, y, width, height);
}

+ (double)cornerRadius
{
  return 5.0;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [v4 mutableCopy];
    v12[0] = 0LL;
    v12[1] = [v4 length];
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesAtIndex:0 effectiveRange:v12]);
    id v7 = [v6 mutableCopy];

    objc_super v8 = -[AMPLanguageAwareString initWithAttributedString:baseParagraphStyle:]( objc_alloc(&OBJC_CLASS___AMPLanguageAwareString),  "initWithAttributedString:baseParagraphStyle:",  v5,  0LL);
    languageAwareString = self->_languageAwareString;
    self->_languageAwareString = v8;

    descriptionTextView = self->_descriptionTextView;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMPLanguageAwareString attributedString](self->_languageAwareString, "attributedString"));
    -[UITextView setAttributedText:](descriptionTextView, "setAttributedText:", v11);

    -[TVMTExpandingTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
    -[TVMTExpandingTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
  [v5 setMaximumNumberOfLines:a3];

  -[TVMTExpandingTextView _setNeedsTextSizeComputation](self, "_setNeedsTextSizeComputation");
  -[TVMTExpandingTextView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)maximumNumberOfLines
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
  id v3 = [v2 maximumNumberOfLines];

  return (unint64_t)v3;
}

- (void)setTrackHorizontal:(BOOL)a3
{
  self->_trackHorizontal = a3;
  floatingView = self->_floatingView;
  if (a3)
  {
    double v4 = 0.04;
    double v5 = 4.0;
  }

  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  -[_UIFloatingContentView setContentMotionRotation:translation:]( floatingView,  "setContentMotionRotation:translation:",  v4,  0.04,  v5,  4.0);
}

- (void)_setNeedsTextSizeComputation
{
  self->_needsTextSizeComputation = 1;
}

- (void)_recomputeTextSizeIfNeeded
{
  if (self->_needsTextSizeComputation)
  {
    self->_needsTextSizeComputation = 0;
    -[UITextView bounds](self->_descriptionTextView, "bounds");
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView attributedText](self->_descriptionTextView, "attributedText"));
    v21.origin.double x = v4;
    v21.origin.double y = v6;
    v21.size.double width = v8;
    v21.size.double height = v10;
    objc_msgSend(v11, "boundingRectWithSize:options:context:", 35, 0, v8 - CGRectGetMinX(v21), 1.79769313e308);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v22.origin.double x = v13;
    v22.origin.double y = v15;
    v22.size.double width = v17;
    v22.size.double height = v19;
    double Height = CGRectGetHeight(v22);
    v23.origin.double x = v4;
    v23.origin.double y = v6;
    v23.size.double width = v8;
    v23.size.double height = v10;
    self->_textTruncating = Height > CGRectGetHeight(v23);
    -[TVMTExpandingTextView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (id)_moreLabelExclusionPath
{
  double v5 = v3;
  double v7 = v6;
  double v9 = v8;
  if (self->_moreLabelOnNewLine)
  {
    -[UITextView frame](self->_descriptionTextView, "frame");
  }

  else
  {
    double v5 = v3 + -10.0;
    double v10 = v4 + 10.0;
  }

  return +[UIBezierPath bezierPathWithRect:](&OBJC_CLASS___UIBezierPath, "bezierPathWithRect:", v5, v7, v10, v9);
}

- (CGRect)_moreLabelFrame
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v12 = v11;
  CGFloat v14 = v13;
  languageAwareString = self->_languageAwareString;
  double v16 = (char *)-[TVMTExpandingTextView maximumNumberOfLines](self, "maximumNumberOfLines") - 1;
  unint64_t v17 = -[TVMTExpandingTextView maximumNumberOfLines](self, "maximumNumberOfLines");
  -[UITextView frame](self->_descriptionTextView, "frame");
  double v19 = v18;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView textContainer](self->_descriptionTextView, "textContainer"));
  id v21 = -[AMPLanguageAwareString writingDirectionOfLine:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:]( languageAwareString,  "writingDirectionOfLine:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:",  v16,  v17,  [v20 lineBreakMode],  1,  v19);

  if (self->_moreLabelOnNewLine)
  {
    if (v21)
    {
      v40.origin.double x = v4;
      v40.origin.double y = v6;
      v40.size.double width = v8;
      v40.size.double height = v10;
      double MaxX = CGRectGetMaxX(v40);
      v41.origin.double x = 0.0;
      v41.origin.double y = 0.0;
      v41.size.double width = v12;
      v41.size.double height = v14;
      double moreHighlightPadding = MaxX - CGRectGetWidth(v41) - self->_moreHighlightPadding;
    }

    else
    {
      double moreHighlightPadding = self->_moreHighlightPadding;
    }
  }

  else
  {
    double moreHighlightPadding = 0.0;
    if (!v21)
    {
      v42.origin.double x = v4;
      v42.origin.double y = v6;
      v42.size.double width = v8;
      v42.size.double height = v10;
      double v24 = CGRectGetMaxX(v42);
      v43.origin.double x = 0.0;
      v43.origin.double y = 0.0;
      v43.size.double width = v12;
      v43.size.double height = v14;
      double moreHighlightPadding = v24 - CGRectGetWidth(v43) + -10.0;
    }

    double v12 = v12 + 10.0;
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView attributedText](self->_descriptionTextView, "attributedText"));
  v44.origin.double x = v4;
  v44.origin.double y = v6;
  v44.size.double width = v8;
  v44.size.double height = v10;
  double MaxY = CGRectGetMaxY(v44);
  if ([v25 length])
  {
    v39[0] = 0LL;
    v39[1] = [v25 length];
    CGRect v27 = (void *)objc_claimAutoreleasedReturnValue([v25 attributesAtIndex:0 effectiveRange:v39]);
    CGRect v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:NSFontAttributeName]);
    [v28 descender];
    double v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_moreLabel, "font"));
    [v31 descender];
    double MaxY = MaxY + v30 - v32;
  }

  v45.origin.double y = 0.0;
  v45.origin.double x = moreHighlightPadding;
  v45.size.double width = v12;
  v45.size.double height = v14;
  double v33 = floor(MaxY - CGRectGetHeight(v45));
  if (self->_moreLabelOnNewLine) {
    double v34 = v33 + -3.0;
  }
  else {
    double v34 = v33;
  }

  double v35 = moreHighlightPadding;
  double v36 = v34;
  double v37 = v12;
  double v38 = v14;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _triggeringPhysicalButton]);
  unint64_t v9 = (unint64_t)[v8 type];

  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 4 && -[TVMTExpandingTextView isFocused](self, "isFocused"))
  {
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 9LL, 1LL);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___TVMTExpandingTextView;
    -[TVMTExpandingTextView pressesBegan:withEvent:](&v10, "pressesBegan:withEvent:", v6, v7);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMTExpandingTextView playRecognizer](self, "playRecognizer"));

  if (v5 != v4) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTExpandingTextView playHandler](self, "playHandler"));
  BOOL v6 = v7 != 0LL;

  return v6;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  backgroundView = self->_backgroundView;
  double v6 = 1.0;
  if ((a5 & 8) == 0) {
    double v6 = 0.0;
  }
  -[UIVisualEffectView setAlpha:](backgroundView, "setAlpha:", a3, a4, v6);
}

- (void)_selectButtonAction:(id)a3
{
  id v7 = a3;
  floatingView = self->_floatingView;
  else {
    uint64_t v5 = 0LL;
  }
  -[_UIFloatingContentView setControlState:animated:](floatingView, "setControlState:animated:", v5, 1LL);
  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, v7);
  }
}

- (void)_playButtonAction:(id)a3
{
  id v7 = a3;
  floatingView = self->_floatingView;
  else {
    uint64_t v5 = 0LL;
  }
  -[_UIFloatingContentView setControlState:animated:](floatingView, "setControlState:animated:", v5, 1LL);
  playHandler = (void (**)(id, id))self->_playHandler;
  if (playHandler) {
    playHandler[2](playHandler, v7);
  }
}

- (NSAttributedString)descriptionText
{
  return self->_descriptionText;
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (UIColor)descriptionTextHighlightColor
{
  return self->_descriptionTextHighlightColor;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (BOOL)isTextTruncating
{
  return self->_textTruncating;
}

- (double)moreHighlightPadding
{
  return self->_moreHighlightPadding;
}

- (void)setMoreHighlightPadding:(double)a3
{
  self->_double moreHighlightPadding = a3;
}

- (BOOL)moreLabelOnNewLine
{
  return self->_moreLabelOnNewLine;
}

- (void)setMoreLabelOnNewLine:(BOOL)a3
{
  self->_moreLabelOnNewLine = a3;
}

- (BOOL)trackHorizontal
{
  return self->_trackHorizontal;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)playHandler
{
  return self->_playHandler;
}

- (void)setPlayHandler:(id)a3
{
}

- (AMPLanguageAwareString)languageAwareString
{
  return self->_languageAwareString;
}

- (void)setLanguageAwareString:(id)a3
{
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UITapGestureRecognizer)selectRecognizer
{
  return self->_selectRecognizer;
}

- (void)setSelectRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)playRecognizer
{
  return self->_playRecognizer;
}

- (void)setPlayRecognizer:(id)a3
{
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
{
}

- (BOOL)needsTextSizeComputation
{
  return self->_needsTextSizeComputation;
}

- (void)setNeedsTextSizeComputation:(BOOL)a3
{
  self->_needsTextSizeComputation = a3;
}

- (void).cxx_destruct
{
}

@end