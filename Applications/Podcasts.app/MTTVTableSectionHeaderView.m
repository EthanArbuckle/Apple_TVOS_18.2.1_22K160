@interface MTTVTableSectionHeaderView
+ (double)height;
- (BOOL)alwaysFloating;
- (MTColorTheme)colorTheme;
- (MTTVTableSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (UILabel)textLabel;
- (id)text;
- (void)layoutSubviews;
- (void)setAlwaysFloating:(BOOL)a3;
- (void)setColorTheme:(id)a3;
- (void)setFloating:(BOOL)a3;
- (void)setNeedsLayout;
- (void)setText:(id)a3;
@end

@implementation MTTVTableSectionHeaderView

+ (double)height
{
  return result;
}

- (MTTVTableSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVTableSectionHeaderView;
  v3 = -[MTTVTableSectionHeaderView initWithReuseIdentifier:](&v8, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___MTTVSectionHeaderView);
    sectionHeaderView = v3->_sectionHeaderView;
    v3->_sectionHeaderView = v4;

    -[MTTVTableSectionHeaderView addSubview:](v3, "addSubview:", v3->_sectionHeaderView);
    v6 = objc_opt_new(&OBJC_CLASS___UIView);
    -[MTTVTableSectionHeaderView setBackgroundView:](v3, "setBackgroundView:", v6);

    -[MTTVTableSectionHeaderView setColorTheme:](v3, "setColorTheme:", 0LL);
  }

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVTableSectionHeaderView;
  -[MTTVTableSectionHeaderView layoutSubviews](&v3, "layoutSubviews");
  -[MTTVTableSectionHeaderView bounds](self, "bounds");
  -[MTTVSectionHeaderView setFrame:](self->_sectionHeaderView, "setFrame:");
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVTableSectionHeaderView;
  -[MTTVTableSectionHeaderView setNeedsLayout](&v3, "setNeedsLayout");
  -[MTTVSectionHeaderView setNeedsLayout](self->_sectionHeaderView, "setNeedsLayout");
}

- (UILabel)textLabel
{
  return -[MTTVSectionHeaderView textLabel](self->_sectionHeaderView, "textLabel");
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTableSectionHeaderView textLabel](self, "textLabel"));
  [v5 setText:v4];

  -[MTTVTableSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)text
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTableSectionHeaderView textLabel](self, "textLabel"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return v3;
}

- (void)setColorTheme:(id)a3
{
  if (a3)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVTableSectionHeaderView colorTheme](self, "colorTheme"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 backgroundColor]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVTableSectionHeaderView backgroundView](self, "backgroundView"));
    [v6 setBackgroundColor:v5];
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[MTTVTableSectionHeaderView backgroundView](self, "backgroundView"));
    [v7 setBackgroundColor:0];
  }
}

- (MTColorTheme)colorTheme
{
  return -[MTTVSectionHeaderView colorTheme](self->_sectionHeaderView, "colorTheme");
}

- (void)setAlwaysFloating:(BOOL)a3
{
}

- (BOOL)alwaysFloating
{
  return -[MTTVSectionHeaderView alwaysFloating](self->_sectionHeaderView, "alwaysFloating");
}

- (void)setFloating:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTTVSectionHeaderView setFloating:](self->_sectionHeaderView, "setFloating:");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVTableSectionHeaderView;
  -[MTTVTableSectionHeaderView setFloating:](&v5, "setFloating:", v3);
}

- (void).cxx_destruct
{
}

@end