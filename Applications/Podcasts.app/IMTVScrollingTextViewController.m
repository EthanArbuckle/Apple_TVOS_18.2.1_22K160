@interface IMTVScrollingTextViewController
+ (id)defaultDescriptionFont;
+ (id)defaultSubtitleFont;
+ (id)defaultTextColor;
+ (id)defaultTiteFont;
- (BOOL)waitingForScroll;
- (IMTVScrollingTextViewController)init;
- (NSAttributedString)descriptionAttributedText;
- (NSString)descriptionText;
- (NSString)subtitleText;
- (NSString)titleText;
- (UIColor)subtitleTextColor;
- (UIColor)textColor;
- (UIFont)descriptionFont;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UILabel)subtitleView;
- (UILabel)titleView;
- (UITextView)descriptionView;
- (_UIRepeatingPressGestureRecognizer)downButtonRecognizer;
- (_UIRepeatingPressGestureRecognizer)upButtonRecognizer;
- (double)descriptionOriginYForTitleFrame:(CGRect)a3 subtitleFrame:(CGRect)a4;
- (double)subtitleOriginYForTitleFrame:(CGRect)a3;
- (int64_t)descriptionTextAlignment;
- (void)_scrollDown:(id)a3;
- (void)_scrollInDirection:(int64_t)a3;
- (void)_scrollInDirection:(int64_t)a3 buttonRecognizer:(id)a4;
- (void)_scrollUp:(id)a3;
- (void)_setupGestureRecognizers;
- (void)setDescriptionAttributedText:(id)a3;
- (void)setDescriptionFont:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextAlignment:(int64_t)a3;
- (void)setDescriptionView:(id)a3;
- (void)setDownButtonRecognizer:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubtitleView:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setUpButtonRecognizer:(id)a3;
- (void)setWaitingForScroll:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation IMTVScrollingTextViewController

- (IMTVScrollingTextViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IMTVScrollingTextViewController;
  v2 = -[IMTVBlurredModalViewController init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    id v4 = [(id)objc_opt_class(v2) defaultTextColor];
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[IMTVScrollingTextViewController setTextColor:](v3, "setTextColor:", v5);

    id v6 = [(id)objc_opt_class(v3) defaultTiteFont];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[IMTVScrollingTextViewController setTitleFont:](v3, "setTitleFont:", v7);

    id v8 = [(id)objc_opt_class(v3) defaultSubtitleFont];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[IMTVScrollingTextViewController setSubtitleFont:](v3, "setSubtitleFont:", v9);

    id v10 = [(id)objc_opt_class(v3) defaultDescriptionFont];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[IMTVScrollingTextViewController setDescriptionFont:](v3, "setDescriptionFont:", v11);
  }

  return v3;
}

+ (id)defaultTextColor
{
  return +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
}

+ (id)defaultTiteFont
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2);
}

+ (id)defaultSubtitleFont
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

+ (id)defaultDescriptionFont
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IMTVScrollingTextViewController;
  -[IMTVScrollingTextViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  [v3 addSubview:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  [v5 addSubview:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v7 addSubview:v8];

  -[IMTVScrollingTextViewController _setupGestureRecognizers](self, "_setupGestureRecognizers");
}

- (void)viewWillLayoutSubviews
{
  v80.receiver = self;
  v80.super_class = (Class)&OBJC_CLASS___IMTVScrollingTextViewController;
  -[IMTVScrollingTextViewController viewWillLayoutSubviews](&v80, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v71 = v6;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleFont](self, "titleFont"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionFont](self, "descriptionFont"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  objc_msgSend(v9, "sizeThatFits:", 1144.0, 1.79769313e308);
  double v11 = v10;
  double v13 = v12;

  [v7 lineHeight];
  double rect_16 = v13;
  if (v13 > v14 + v14) {
    double v11 = 1144.0;
  }
  double v15 = UIRoundToViewScale(0LL, (v5 - v11) * 0.5);
  objc_msgSend(v7, "im_distanceFromFirstBaselineToTop");
  double v17 = 110.0 - v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  objc_msgSend(v18, "sizeThatFits:", v5, 1.79769313e308);
  double v20 = v19;
  double rect_24 = v21;

  double v22 = UIRoundToViewScale(0LL, (v5 - v20) * 0.5);
  -[IMTVScrollingTextViewController subtitleOriginYForTitleFrame:]( self,  "subtitleOriginYForTitleFrame:",  v15,  v17,  v11,  v13);
  double v69 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  double v75 = 1164.0;
  objc_msgSend(v24, "sizeThatFits:");
  double v67 = v25;
  double v27 = v26;

  double v68 = v5;
  double rect = UIRoundToViewScale(0LL, (v5 + -1144.0) * 0.5);
  double rect_8 = v15;
  CGFloat v28 = v17;
  double v73 = v22;
  double v74 = v20;
  -[IMTVScrollingTextViewController descriptionOriginYForTitleFrame:subtitleFrame:]( self,  "descriptionOriginYForTitleFrame:subtitleFrame:",  v15,  v17,  v11,  rect_16,  v22,  v69,  v20,  rect_24);
  double v30 = v29;
  double v31 = v71 - v29 + -40.0;
  if (v27 <= v31)
  {
    CGFloat v40 = v27;
    v81.origin.x = v15;
    double v41 = v28;
    v81.origin.y = v28;
    double v37 = v11;
    v81.size.width = v11;
    CGFloat v42 = v30;
    v81.size.height = rect_16;
    double MinY = CGRectGetMinY(v81);
    objc_msgSend(v7, "im_distanceFromCapHeightToAscent");
    double v45 = MinY - v44;
    v82.size.width = 1164.0;
    v82.origin.x = rect;
    CGFloat v46 = v42;
    v82.origin.y = v42;
    double v75 = 1164.0;
    double v66 = v40;
    v82.size.height = v40;
    double MaxY = CGRectGetMaxY(v82);
    objc_msgSend(v8, "im_distanceFromLastBaselineToBottom");
    double v49 = MaxY - v48 - v45;
    double v39 = v15;
    double v50 = UIRoundToViewScale(0LL, (v71 - v49) * 0.5);
    objc_msgSend(v7, "im_distanceFromCapHeightToAscent");
    double v52 = v50 - v51;
    -[IMTVScrollingTextViewController subtitleOriginYForTitleFrame:]( self,  "subtitleOriginYForTitleFrame:",  v15,  v50 - v51,  v37,  rect_16);
    double v54 = v53;
    -[IMTVScrollingTextViewController descriptionOriginYForTitleFrame:subtitleFrame:]( self,  "descriptionOriginYForTitleFrame:subtitleFrame:",  v15,  v52,  v37,  rect_16,  v73,  v53,  v74,  rect_24);
    double v65 = v52;
    if (v52 >= v41)
    {
      double v70 = v54;
      double v72 = v55;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
      [v56 textContainerInset];
      double v58 = v57;
      double v60 = v59;

      double v33 = v66;
      [v8 lineHeight];
      if (v66 - v58 - v60 < UIFloorToViewScale(0LL, v61 * 1.5))
      {
        double v75 = v67;
        double rect = UIRoundToViewScale(0LL, (v68 - v67) * 0.5);
      }

      double v39 = rect_8;
      double v34 = v73;
      double v20 = v74;
      double v35 = rect_24;
      double v36 = v70;
      double v38 = v65;
    }

    else
    {
      double v36 = v69;
      double v38 = v41;
      double v72 = v46;
      double v34 = v73;
      double v20 = v74;
      double v35 = rect_24;
      double v33 = v66;
    }
  }

  else
  {
    double v32 = v17;
    double v72 = v30;
    double v33 = v31;
    double v34 = v22;
    double v35 = rect_24;
    double v36 = v69;
    double v37 = v11;
    double v38 = v32;
    double v39 = rect_8;
  }

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView", *(void *)&v65));
  objc_msgSend(v62, "setFrame:", v39, v38, v37, rect_16);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  objc_msgSend(v63, "setFrame:", v34, v36, v20, v35);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  objc_msgSend(v64, "setFrame:", rect, v72, v75, v33);
}

- (double)subtitleOriginYForTitleFrame:(CGRect)a3
{
  double MaxY = CGRectGetMaxY(a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleFont](self, "titleFont"));
  objc_msgSend(v5, "im_distanceFromLastBaselineToBottom");
  double v7 = MaxY - v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleFont](self, "subtitleFont"));
  objc_msgSend(v8, "im_distanceFromCapHeightToAscent");
  double v10 = v7 + 45.0 - v9;

  return v10;
}

- (double)descriptionOriginYForTitleFrame:(CGRect)a3 subtitleFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleText](self, "subtitleText"));
  id v14 = [v13 length];

  if (v14)
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v24);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleFont](self, "subtitleFont"));
    double v17 = 45.0;
  }

  else
  {
    v25.origin.CGFloat x = v11;
    v25.origin.CGFloat y = v10;
    v25.size.CGFloat width = v9;
    v25.size.CGFloat height = v8;
    double MaxY = CGRectGetMaxY(v25);
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleFont](self, "titleFont"));
    double v17 = 90.0;
  }

  objc_msgSend(v16, "im_distanceFromLastBaselineToBottom");
  double v19 = MaxY - v18;

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionFont](self, "descriptionFont"));
  objc_msgSend(v20, "im_distanceFromCapHeightToAscent");
  double v22 = v19 + v17 - v21;

  return v22;
}

- (NSString)titleText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  [v5 setText:v4];

  if (-[IMTVScrollingTextViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
    [v6 setNeedsLayout];
  }

- (NSString)subtitleText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setSubtitleText:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  [v5 setText:v4];

  if (-[IMTVScrollingTextViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
    [v6 setNeedsLayout];
  }

- (NSString)descriptionText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  v13[0] = NSFontAttributeName;
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionFont](self, "descriptionFont"));
  v14[0] = v5;
  v13[1] = NSForegroundColorAttributeName;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 textColor]);
  v14[1] = v7;
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

  CGFloat v9 = -[AMPLanguageAwareString initWithString:attributes:baseParagraphStyle:]( objc_alloc(&OBJC_CLASS___AMPLanguageAwareString),  "initWithString:attributes:baseParagraphStyle:",  v4,  v8,  0LL);
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMPLanguageAwareString attributedString](v9, "attributedString"));
  CGFloat v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v11 setAttributedText:v10];

  if (-[IMTVScrollingTextViewController isViewLoaded](self, "isViewLoaded"))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
    [v12 setNeedsLayout];
  }
}

- (NSAttributedString)descriptionAttributedText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributedText]);

  return (NSAttributedString *)v3;
}

- (void)setDescriptionAttributedText:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v5 setAttributedText:v4];

  if (-[IMTVScrollingTextViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
    [v6 setNeedsLayout];
  }

- (void)setTextColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (!v4)
  {
    id v5 = [(id)objc_opt_class(self) defaultTextColor];
    id v4 = (UIColor *)objc_claimAutoreleasedReturnValue(v5);
  }

  textColor = self->_textColor;
  self->_textColor = v4;
  double v7 = v4;

  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  [v8 setTextColor:v7];

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleTextColor](self, "subtitleTextColor"));
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  [v10 setTextColor:v9];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v11 setTextColor:v7];
}

- (UIColor)subtitleTextColor
{
  subtitleTextColor = self->_subtitleTextColor;
  if (subtitleTextColor) {
    return subtitleTextColor;
  }
  else {
    return (UIColor *)(id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController textColor](self, "textColor"));
  }
}

- (void)setSubtitleTextColor:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleTextColor](self, "subtitleTextColor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  [v4 setTextColor:v5];
}

- (UIFont)titleFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 font]);

  return (UIFont *)v3;
}

- (void)setTitleFont:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    id v5 = [(id)objc_opt_class(self) defaultTiteFont];
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController titleView](self, "titleView"));
  [v6 setFont:v4];

  double v7 = v8;
  if (!v8)
  {

    double v7 = 0LL;
  }
}

- (UIFont)subtitleFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 font]);

  return (UIFont *)v3;
}

- (void)setSubtitleFont:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    id v5 = [(id)objc_opt_class(self) defaultDescriptionFont];
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController subtitleView](self, "subtitleView"));
  [v6 setFont:v4];

  double v7 = v8;
  if (!v8)
  {

    double v7 = 0LL;
  }
}

- (UIFont)descriptionFont
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 font]);

  return (UIFont *)v3;
}

- (void)setDescriptionFont:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (!v4)
  {
    id v5 = [(id)objc_opt_class(self) defaultDescriptionFont];
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v6 setFont:v4];

  double v7 = v8;
  if (!v8)
  {

    double v7 = 0LL;
  }
}

- (int64_t)descriptionTextAlignment
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  id v3 = [v2 textAlignment];

  return (int64_t)v3;
}

- (void)setDescriptionTextAlignment:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  id v6 = [v5 textAlignment];

  if (v6 != (id)a3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
    [v7 setTextAlignment:a3];
  }

- (void)_setupGestureRecognizers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 panGestureRecognizer]);
  [v3 addGestureRecognizer:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_UIRepeatingPressGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS____UIRepeatingPressGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "_scrollUp:",  0LL));
  -[IMTVScrollingTextViewController setUpButtonRecognizer:](self, "setUpButtonRecognizer:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController upButtonRecognizer](self, "upButtonRecognizer"));
  [v7 addGestureRecognizer:v8];

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( +[_UIRepeatingPressGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS____UIRepeatingPressGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "_scrollDown:",  1LL));
  -[IMTVScrollingTextViewController setDownButtonRecognizer:](self, "setDownButtonRecognizer:", v9);

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController view](self, "view"));
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController downButtonRecognizer](self, "downButtonRecognizer"));
  [v11 addGestureRecognizer:v10];
}

- (void)_scrollUp:(id)a3
{
}

- (void)_scrollDown:(id)a3
{
}

- (void)_scrollInDirection:(int64_t)a3 buttonRecognizer:(id)a4
{
  id v6 = [a4 state];
  if (v6 != (id)2)
  {
    if (v6 == (id)1)
    {
      -[IMTVScrollingTextViewController _scrollInDirection:](self, "_scrollInDirection:", a3);
      return;
    }

    id v7 = self;
    uint64_t v8 = 0LL;
    goto LABEL_8;
  }

  if (!-[IMTVScrollingTextViewController waitingForScroll](self, "waitingForScroll"))
  {
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    -[IMTVScrollingTextViewController performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_scrollInDirection:",  v9,  0.300000012);

    id v7 = self;
    uint64_t v8 = 1LL;
LABEL_8:
    -[IMTVScrollingTextViewController setWaitingForScroll:](v7, "setWaitingForScroll:", v8);
  }

- (void)_scrollInDirection:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v5 contentOffset];
  double v7 = v6;
  double v9 = v8;

  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v10 frame];
  double Height = CGRectGetHeight(v27);

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v12 contentSize];
  double v14 = v13;

  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v15 contentInset];
  double v17 = v16;
  double v19 = v18;

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
  [v20 frame];
  double v22 = v21;

  if (v14 > v22)
  {
    double v23 = v9 + (double)a3 * (Height * 0.850000024);
    double v24 = -v17;
    if (v23 >= -v17)
    {
      double v25 = v14 - Height * 0.850000024;
      double v24 = v23;
      if (v23 > v25) {
        double v24 = v25 + v19;
      }
    }

    double v26 = (void *)objc_claimAutoreleasedReturnValue(-[IMTVScrollingTextViewController descriptionView](self, "descriptionView"));
    objc_msgSend(v26, "setContentOffset:animated:", 1, v7, v24);
  }

  -[IMTVScrollingTextViewController setWaitingForScroll:](self, "setWaitingForScroll:", 0LL);
}

- (UILabel)titleView
{
  titleView = self->_titleView;
  if (!titleView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_titleView;
    self->_titleView = v4;

    -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", 4LL);
    -[UILabel setTextAlignment:](self->_titleView, "setTextAlignment:", 1LL);
    titleView = self->_titleView;
  }

  return titleView;
}

- (UILabel)subtitleView
{
  subtitleView = self->_subtitleView;
  if (!subtitleView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_subtitleView;
    self->_subtitleView = v4;

    -[UILabel setTextAlignment:](self->_subtitleView, "setTextAlignment:", 1LL);
    subtitleView = self->_subtitleView;
  }

  return subtitleView;
}

- (UITextView)descriptionView
{
  descriptionView = self->_descriptionView;
  if (!descriptionView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UITextView);
    id v5 = self->_descriptionView;
    self->_descriptionView = v4;

    -[UITextView setBounces:](self->_descriptionView, "setBounces:", 1LL);
    -[UITextView setEditable:](self->_descriptionView, "setEditable:", 0LL);
    -[UITextView setSelectable:](self->_descriptionView, "setSelectable:", 1LL);
    -[UITextView setShowsVerticalScrollIndicator:](self->_descriptionView, "setShowsVerticalScrollIndicator:", 1LL);
    -[UITextView setIndicatorStyle:](self->_descriptionView, "setIndicatorStyle:", 1LL);
    -[UITextView _setGradientMaskInsets:](self->_descriptionView, "_setGradientMaskInsets:", 64.0, 0.0, 64.0, 0.0);
    -[UITextView setTextContainerInset:](self->_descriptionView, "setTextContainerInset:", 0.0, 0.0, 0.0, 20.0);
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView layoutManager](self->_descriptionView, "layoutManager"));
    [v6 setAllowsNonContiguousLayout:0];

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView panGestureRecognizer](self->_descriptionView, "panGestureRecognizer"));
    [v7 setAllowedTouchTypes:&off_1002551D0];

    descriptionView = self->_descriptionView;
  }

  return descriptionView;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTitleView:(id)a3
{
}

- (void)setSubtitleView:(id)a3
{
}

- (void)setDescriptionView:(id)a3
{
}

- (_UIRepeatingPressGestureRecognizer)upButtonRecognizer
{
  return self->_upButtonRecognizer;
}

- (void)setUpButtonRecognizer:(id)a3
{
}

- (_UIRepeatingPressGestureRecognizer)downButtonRecognizer
{
  return self->_downButtonRecognizer;
}

- (void)setDownButtonRecognizer:(id)a3
{
}

- (BOOL)waitingForScroll
{
  return self->_waitingForScroll;
}

- (void)setWaitingForScroll:(BOOL)a3
{
  self->_waitingForScroll = a3;
}

- (void).cxx_destruct
{
}

@end