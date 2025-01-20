@interface MTTVSectionHeaderView
+ (double)height;
+ (id)font;
- (BOOL)alwaysFloating;
- (BOOL)floating;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTTVSectionHeaderView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)contentInset;
- (UILabel)textLabel;
- (UIView)contentView;
- (UIView)dividerBar;
- (_UIBackdropView)backdropView;
- (_UIBackdropView)backgroundView;
- (double)maxWidth;
- (void)_configureSubviews;
- (void)_updateBlurEffects;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAlwaysFloating:(BOOL)a3;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
- (void)setDividerBar:(id)a3;
- (void)setFloating:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setTextLabel:(id)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTTVSectionHeaderView

+ (double)height
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 font]);
  [v2 capHeight];
  double v4 = v3;
  if (qword_1002B6C10 != -1) {
    dispatch_once(&qword_1002B6C10, &stru_1002454C0);
  }
  double v5 = ceil(v4 * *(double *)&qword_1002B47E0) / *(double *)&qword_1002B47E0;
  double v6 = ceil(v4);
  double v7 = v5 + 8.0 + 8.0;

  return v7;
}

+ (id)font
{
  return +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody);
}

- (MTTVSectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVSectionHeaderView;
  double v3 = -[MTTVSectionHeaderView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  double v4 = v3;
  if (v3)
  {
    -[MTTVSectionHeaderView _configureSubviews](v3, "_configureSubviews");
    -[MTTVSectionHeaderView setPreservesSuperviewLayoutMargins:](v4, "setPreservesSuperviewLayoutMargins:", 1LL);
    v4->_maxWidth = 1.79769313e308;
  }

  return v4;
}

- (void)_configureSubviews
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView contentView](self, "contentView"));
  -[MTTVSectionHeaderView addSubview:](self, "addSubview:", v3);

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView contentView](self, "contentView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  [v4 addSubview:v5];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView contentView](self, "contentView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView dividerBar](self, "dividerBar"));
  [v7 addSubview:v6];
}

- (void)setColorTheme:(id)a3
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor primaryTextColorForTheme:](&OBJC_CLASS___UIColor, "primaryTextColorForTheme:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  [v7 setTextColor:v6];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor separatorColorForTheme:](&OBJC_CLASS___UIColor, "separatorColorForTheme:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView dividerBar](self, "dividerBar"));
  [v8 setBackgroundColor:v9];
}

- (void)prepareForReuse
{
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
  -[MTTVSectionHeaderView _updateBlurEffects](self, "_updateBlurEffects");
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[MTTVSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setAlwaysFloating:(BOOL)a3
{
  self->_alwaysFloating = a3;
  -[MTTVSectionHeaderView _updateBlurEffects](self, "_updateBlurEffects");
}

- (void)_updateBlurEffects
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView colorTheme](self, "colorTheme"));
  if (v3)
  {

LABEL_3:
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView backgroundView](self, "backgroundView"));
    [v4 removeFromSuperview];
    goto LABEL_4;
  }

  if (!-[MTTVSectionHeaderView floating](self, "floating")
    && !-[MTTVSectionHeaderView alwaysFloating](self, "alwaysFloating"))
  {
    goto LABEL_3;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView backgroundView](self, "backgroundView"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);

  if (v6) {
    goto LABEL_5;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView backgroundView](self, "backgroundView"));
  -[MTTVSectionHeaderView insertSubview:atIndex:](self, "insertSubview:atIndex:", v4, 0LL);
LABEL_4:

LABEL_5:
  -[MTTVSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (_UIBackdropView)backgroundView
{
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    double v4 = -[_UIBackdropView initWithPrivateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithPrivateStyle:",  2010LL);
    id v5 = self->_backdropView;
    self->_backdropView = v4;

    backdropView = self->_backdropView;
  }

  return backdropView;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIView);
    id v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }

  return contentView;
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    id v5 = self->_textLabel;
    self->_textLabel = v4;

    id v6 = [(id)objc_opt_class(self) font];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[UILabel setFont:](self->_textLabel, "setFont:", v7);

    textLabel = self->_textLabel;
  }

  return textLabel;
}

- (UIView)dividerBar
{
  dividerBar = self->_dividerBar;
  if (!dividerBar)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIView);
    id v5 = self->_dividerBar;
    self->_dividerBar = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dividerColor](&OBJC_CLASS___UIColor, "dividerColor"));
    -[UIView setBackgroundColor:](self->_dividerBar, "setBackgroundColor:", v6);

    dividerBar = self->_dividerBar;
  }

  return dividerBar;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVSectionHeaderView;
  id v4 = a3;
  -[MTTVSectionHeaderView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 horizontalSizeClass];
  id v7 = [v4 horizontalSizeClass];

  if (v6 != v7) {
    -[MTTVSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___MTTVSectionHeaderView;
  -[MTTVSectionHeaderView layoutSubviews](&v59, "layoutSubviews");
  -[MTTVSectionHeaderView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView backgroundView](self, "backgroundView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[MTTVSectionHeaderView bounds](self, "bounds");
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView contentView](self, "contentView"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  unsigned int v21 = -[MTTVSectionHeaderView mt_isRTL](self, "mt_isRTL");
  -[MTTVSectionHeaderView layoutMargins](self, "layoutMargins");
  double v23 = v22;
  -[MTTVSectionHeaderView layoutMargins](self, "layoutMargins");
  double v25 = v24;
  -[MTTVSectionHeaderView bounds](self, "bounds");
  double v27 = v26;
  double v28 = v26 - v23 - v25;
  -[MTTVSectionHeaderView maxWidth](self, "maxWidth");
  if (v28 > v29)
  {
    -[MTTVSectionHeaderView maxWidth](self, "maxWidth");
    double v25 = IMRoundToPixel((v27 - v30) * 0.5);
    double v23 = v25;
  }

  -[MTTVSectionHeaderView bounds](self, "bounds");
  double Width = CGRectGetWidth(v60);
  double v32 = Width - v23;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  [v33 frame];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 font]);
  [v35 lineHeight];
  double v37 = v36;
  if (qword_1002B6C10 != -1) {
    dispatch_once(&qword_1002B6C10, &stru_1002454C0);
  }
  double v38 = ceil(v37 * *(double *)&qword_1002B47E0) / *(double *)&qword_1002B47E0;
  double v39 = ceil(v37);
  else {
    double v40 = v38;
  }

  double v41 = v23;
  if (v21)
  {
    -[MTTVSectionHeaderView bounds](self, "bounds");
    double v41 = CGRectGetMaxX(v61) - (v32 - v25) - v23;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 font]);
  objc_msgSend(v43, "mt_offsetFromCapHeightToAscent");
  double v45 = v44;
  if (qword_1002B6C10 != -1) {
    dispatch_once(&qword_1002B6C10, &stru_1002454C0);
  }
  double v46 = ceil(v45 * *(double *)&qword_1002B47E0) / *(double *)&qword_1002B47E0;
  double v47 = ceil(v45);
  double v48 = 8.0 - v46;

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView textLabel](self, "textLabel"));
  objc_msgSend(v49, "setFrame:", v41, v48, v32 - v25, v40);

  if (!-[MTTVSectionHeaderView floating](self, "floating"))
  {
    unsigned int v50 = -[MTTVSectionHeaderView isHorizontallyRegular](self, "isHorizontallyRegular");
    double v51 = 0.0;
    if (v50) {
      double v51 = v25;
    }
    double Width = v32 - v51;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v52 scale];
  double v54 = v53;

  unsigned int v55 = -[MTTVSectionHeaderView floating](self, "floating");
  if (v55) {
    double v23 = 0.0;
  }
  if ((v55 & 1) == 0 && ((v21 ^ 1) & 1) == 0)
  {
    else {
      double v23 = 0.0;
    }
  }

  double v56 = 1.0 / v54;
  -[MTTVSectionHeaderView bounds](self, "bounds");
  CGFloat v57 = CGRectGetMaxY(v62) - 1.0 / v54;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSectionHeaderView dividerBar](self, "dividerBar"));
  objc_msgSend(v58, "setFrame:", v23, v57, Width, v56);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class(self) height];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)setTextLabel:(id)a3
{
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)floating
{
  return self->_floating;
}

- (BOOL)alwaysFloating
{
  return self->_alwaysFloating;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setContentView:(id)a3
{
}

- (void)setDividerBar:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIEdgeInsets)_layoutMargins
{
  double top = self->__layoutMargins.top;
  double left = self->__layoutMargins.left;
  double bottom = self->__layoutMargins.bottom;
  double right = self->__layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void).cxx_destruct
{
}

@end