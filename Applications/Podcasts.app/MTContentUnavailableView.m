@interface MTContentUnavailableView
+ (id)messageLabelWithFrame:(CGRect)a3;
- (MTColorTheme)colorTheme;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4;
- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 message:(id)a5;
- (NSString)buttonText;
- (NSString)message;
- (NSString)title;
- (UIImage)placeholderImage;
- (id)buttonCallback;
- (void)_buttonClick;
- (void)_sizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setButtonCallback:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTContentUnavailableView

+ (id)messageLabelWithFrame:(CGRect)a3
{
  v3 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
  -[UILabel setOpaque:](v3, "setOpaque:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v3, "setFont:", v5);

  -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 0LL);
  -[UILabel setAlpha:](v3, "setAlpha:", 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setTextColor:](v3, "setTextColor:", v6);

  return v3;
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3
{
  return -[MTContentUnavailableView initWithFrame:title:]( self,  "initWithFrame:title:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4
{
  return -[MTContentUnavailableView initWithFrame:title:message:]( self,  "initWithFrame:title:message:",  a4,  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (MTContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 message:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MTContentUnavailableView;
  v13 = -[MTContentUnavailableView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[MTContentUnavailableView setAutoresizingMask:](v13, "setAutoresizingMask:", 18LL);
    v15 = objc_alloc(&OBJC_CLASS___UIView);
    -[MTContentUnavailableView bounds](v14, "bounds");
    v16 = -[UIView initWithFrame:](v15, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v22), 0.0);
    containerView = v14->_containerView;
    v14->_containerView = v16;

    -[MTContentUnavailableView addSubview:](v14, "addSubview:", v14->_containerView);
    -[MTContentUnavailableView setTitle:](v14, "setTitle:", v11);
    -[MTContentUnavailableView setMessage:](v14, "setMessage:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[MTContentUnavailableView setBackgroundColor:](v14, "setBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v14 selector:"_sizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }

  return v14;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTContentUnavailableView;
  -[MTContentUnavailableView dealloc](&v4, "dealloc");
}

- (void)setColorTheme:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  if (v15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](&OBJC_CLASS___UIColor, "primaryTextColorForTheme:", v15));
    p_titleLabel = &self->_titleLabel;
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](&OBJC_CLASS___UIColor, "secondaryTextColorForTheme:", v15));
    p_messageLabel = &self->_messageLabel;
    double v9 = 1.0;
    v10 = &self->_messageLabel;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v10 = &self->_messageLabel;
    -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v7);
    p_messageLabel = &self->_titleLabel;
    double v9 = 0.400000006;
    p_titleLabel = &self->_titleLabel;
  }

  -[UILabel setTextColor:](*p_messageLabel, "setTextColor:", v7);

  -[UILabel setAlpha:](*v10, "setAlpha:", v9);
  -[UILabel setAlpha:](*p_titleLabel, "setAlpha:", v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 backgroundColor]);
  if (v11)
  {
    -[MTContentUnavailableView setBackgroundColor:](self, "setBackgroundColor:", v11);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[MTContentUnavailableView setBackgroundColor:](self, "setBackgroundColor:", v12);
  }

  button = self->_button;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](&OBJC_CLASS___UIColor, "tintColorForTheme:", v15));
  -[UIButton setTitleColor:forState:](button, "setTitleColor:forState:", v14, 0LL);
}

- (void)setButtonText:(id)a3
{
  id v12 = a3;
  if (!-[NSString isEqualToString:](self->_buttonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_buttonText, a3);
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    button = self->_button;
    self->_button = v5;

    -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v12, 0LL);
    -[UIButton addTarget:action:forControlEvents:]( self->_button,  "addTarget:action:forControlEvents:",  self,  "_buttonClick",  64LL);
    v7 = self->_button;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
    -[UIButton setTitleColor:forState:](v7, "setTitleColor:forState:", v8, 0LL);

    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
    [v10 setFont:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
    [v11 setTextAlignment:1];

    -[UIButton sizeToFit](self->_button, "sizeToFit");
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_button);
  }
}

- (void)setPlaceholderImage:(id)a3
{
  id v7 = a3;
  if ((-[UIImage isEqual:](self->_placeholderImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v7);
    imageView = self->_imageView;
    self->_imageView = v5;

    -[UIView addSubview:](self->_containerView, "addSubview:", self->_imageView);
  }

  -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    v6 = self->_title;
    if (v6)
    {
      if (!self->_titleLabel)
      {
        id v7 = objc_alloc(&OBJC_CLASS___UILabel);
        -[UIView bounds](self->_containerView, "bounds");
        v8 = -[UILabel initWithFrame:](v7, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v13), 20.0);
        titleLabel = self->_titleLabel;
        self->_titleLabel = v8;

        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
        -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v10);

        -[UILabel setOpaque:](self->_titleLabel, "setOpaque:", 0LL);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleHeadline));
        -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
        -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

        -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.4);
        -[UIView addSubview:](self->_containerView, "addSubview:", self->_titleLabel);
        v6 = self->_title;
      }
    }

    -[UILabel setText:](self->_titleLabel, "setText:", v6);
    -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setMessage:(id)a3
{
  if (self->_message != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    message = self->_message;
    self->_message = v4;

    v6 = self->_message;
    if (v6)
    {
      if (!self->_messageLabel)
      {
        id v7 = (void *)objc_opt_class(self);
        -[UIView bounds](self->_containerView, "bounds");
        id v8 = objc_msgSend(v7, "messageLabelWithFrame:", 0.0, 0.0, CGRectGetWidth(v11), 20.0);
        double v9 = (UILabel *)objc_claimAutoreleasedReturnValue(v8);
        messageLabel = self->_messageLabel;
        self->_messageLabel = v9;

        -[UIView addSubview:](self->_containerView, "addSubview:", self->_messageLabel);
        v6 = self->_message;
      }
    }

    -[UILabel setText:](self->_messageLabel, "setText:", v6);
    -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)&OBJC_CLASS___MTContentUnavailableView;
  -[MTContentUnavailableView layoutSubviews](&v95, "layoutSubviews");
  -[MTContentUnavailableView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView frame](self->_containerView, "frame");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v96.origin.double x = v4;
  v96.origin.double y = v6;
  v96.size.double width = v8;
  v96.size.double height = v10;
  double v89 = v6;
  double v90 = v4;
  double v87 = v10;
  double v88 = v8;
  if (CGRectGetWidth(v96) >= 478.0)
  {
    IMRectCenteredXInRectScale(v12, v14, 418.0, v16, v4, v6, v8, v10, 0.0);
    double v14 = v19;
    double v17 = v20;
    double v16 = v21;
  }

  else
  {
    v97.origin.double x = v4;
    v97.origin.double y = v6;
    v97.size.double width = v8;
    v97.size.double height = v10;
    double v17 = CGRectGetWidth(v97) + -30.0;
    double v18 = 15.0;
  }

  double y = CGPointZero.y;
  double v85 = v18;
  double v23 = v14;
  double v24 = v17;
  double v25 = v16;
  double Width = CGRectGetWidth(*(CGRect *)&v18);
  -[UIImageView frame](self->_imageView, "frame");
  double v93 = y;
  double v94 = v17;
  CGFloat v30 = IMRectCenteredXInRectScale(v26, v27, v28, v29, CGPointZero.x, y, v17, v16, 0.0);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UILabel frame](self->_titleLabel, "frame");
  double v38 = v37;
  double v39 = 0.0;
  if (self->_imageView)
  {
    v98.origin.double x = v30;
    v98.origin.double y = v32;
    v98.size.double width = v34;
    v98.size.double height = v36;
    double v39 = CGRectGetMaxY(v98) + 40.0;
  }

  double v86 = v14;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width, 1.79769313e308);
  double v40 = v16;
  CGFloat v43 = IMRectCenteredXInRectScale(v38, v39, v41, v42, CGPointZero.x, v93, v94, v16, 0.0);
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  -[UILabel frame](self->_messageLabel, "frame");
  double v51 = v50;
  double v52 = 0.0;
  if (self->_title)
  {
    v99.origin.double x = v43;
    v99.origin.double y = v45;
    v99.size.double width = v47;
    v99.size.double height = v49;
    double v52 = CGRectGetMaxY(v99) + 20.0;
  }

  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", Width, 1.79769313e308);
  double v84 = v40;
  CGFloat v55 = IMRectCenteredXInRectScale(v51, v52, v53, v54, CGPointZero.x, v93, v94, v40, 0.0);
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  CGFloat v62 = v55;
  double v92 = v55;
  -[UILabel setFrame:](self->_messageLabel, "setFrame:");
  -[UIButton frame](self->_button, "frame");
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  v100.origin.double x = v62;
  v100.origin.double y = v57;
  v100.size.double width = v59;
  v100.size.double height = v61;
  CGFloat MaxY = CGRectGetMaxY(v100);
  double v70 = IMRectCenteredXInRectScale(v64, MaxY + 30.0, v66, v68, CGPointZero.x, v93, v94, v84, 0.0);
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  -[UIButton setFrame:](self->_button, "setFrame:");
  button = self->_button;
  double v78 = v92;
  if (button)
  {
    double v78 = v70;
    double v79 = v72;
  }

  else
  {
    double v79 = v57;
  }

  if (button) {
    double v80 = v74;
  }
  else {
    double v80 = v59;
  }
  if (button) {
    double v81 = v76;
  }
  else {
    double v81 = v61;
  }
  double v82 = CGRectGetMaxY(*(CGRect *)&v78);
  IMRectCenteredYInRectScale(v83, v85, v86, v94, v82, v90, v89, v88, v87, 0.0);
  -[UIView setFrame:](self->_containerView, "setFrame:");
}

- (void)_buttonClick
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTContentUnavailableView buttonCallback](self, "buttonCallback"));

  if (v3)
  {
    double v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTContentUnavailableView buttonCallback](self, "buttonCallback"));
    v4[2]();
  }

- (void)_sizeCategoryDidChange:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
  [v6 setFont:v5];

  -[UIButton sizeToFit](self->_button, "sizeToFit");
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](self->_messageLabel, "setFont:", v7);

  -[MTContentUnavailableView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (id)buttonCallback
{
  return self->_buttonCallback;
}

- (void)setButtonCallback:(id)a3
{
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
}

@end