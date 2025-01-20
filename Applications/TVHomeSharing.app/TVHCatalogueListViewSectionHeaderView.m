@interface TVHCatalogueListViewSectionHeaderView
- (NSString)title;
- (TVHCatalogueListViewSectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setTitle:(id)a3;
@end

@implementation TVHCatalogueListViewSectionHeaderView

- (TVHCatalogueListViewSectionHeaderView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewSectionHeaderView;
  v3 = -[TVHCatalogueListViewSectionHeaderView initWithFrame:]( &v15,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 10LL));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4LL);
    v8 = v3->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_25PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_25PercentWhiteColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));
    -[UILabel setTextColor:](v8, "setTextColor:", v11);

    v12 = v3->_titleLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[TVHCatalogueListViewSectionHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 localizedUppercaseString]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewSectionHeaderView title](self, "title"));
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewSectionHeaderView titleLabel](self, "titleLabel"));
    [v6 setText:v7];
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewSectionHeaderView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewSectionHeaderView;
  -[TVHCatalogueListViewSectionHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[TVHCatalogueListViewSectionHeaderView setTitle:](self, "setTitle:", 0LL);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewSectionHeaderView;
  -[TVHCatalogueListViewSectionHeaderView layoutSubviews](&v6, "layoutSubviews");
  -[TVHCatalogueListViewSectionHeaderView bounds](self, "bounds");
  double v4 = v3 + -20.0 + -20.0;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewSectionHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setFrame:", 20.0, 43.0, v4, 46.0);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end