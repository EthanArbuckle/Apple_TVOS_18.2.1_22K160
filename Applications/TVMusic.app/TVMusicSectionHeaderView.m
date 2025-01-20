@interface TVMusicSectionHeaderView
- (BOOL)visibleContentIntersectsRect:(CGRect)a3;
- (NSString)headerText;
- (TVMusicSectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)headingLabel;
- (void)_addHeadingLabel;
- (void)setHeaderText:(id)a3;
- (void)setHeadingLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicSectionHeaderView

- (TVMusicSectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicSectionHeaderView;
  v3 = -[TVMusicSectionHeaderView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3) {
    -[TVMusicSectionHeaderView _addHeadingLabel](v3, "_addHeadingLabel");
  }
  return v4;
}

- (void)setHeaderText:(id)a3
{
  p_headerText = &self->_headerText;
  objc_storeStrong((id *)&self->_headerText, a3);
  id v6 = a3;
  v7 = *p_headerText;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView headingLabel](self, "headingLabel"));
  [v8 setText:v7];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView headingLabel](self, "headingLabel"));
  [v9 sizeToFit];

  -[TVMusicSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_addHeadingLabel
{
  v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  headingLabel = self->_headingLabel;
  self->_headingLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager headlineEmphasizedFont](&OBJC_CLASS___TVThemeManager, "headlineEmphasizedFont"));
  -[UILabel setFont:](self->_headingLabel, "setFont:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
  -[UILabel setTextColor:](self->_headingLabel, "setTextColor:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_headingLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVMusicSectionHeaderView addSubview:](self, "addSubview:", self->_headingLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView bottomAnchor](self, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_headingLabel, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToAnchor:v8 constant:15.0]);
  [v9 setActive:1];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_headingLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView leadingAnchor](self, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v10]);
  [v11 setActive:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView headingLabel](self, "headingLabel"));
    [v7 setTextColor:v8];
  }

- (BOOL)visibleContentIntersectsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView headingLabel](self, "headingLabel"));
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicSectionHeaderView superview](self, "superview"));
  -[TVMusicSectionHeaderView convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v27.origin.CGFloat x = v19;
  v27.origin.CGFloat y = v21;
  v27.size.CGFloat width = v23;
  v27.size.CGFloat height = v25;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  return CGRectIntersectsRect(v27, v28);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (UILabel)headingLabel
{
  return self->_headingLabel;
}

- (void)setHeadingLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end