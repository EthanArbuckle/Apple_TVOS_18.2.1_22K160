@interface TVHCollectionViewSectionHeaderView
- (NSLayoutConstraint)titleLabelTopAnchorConstraint;
- (NSString)title;
- (UILabel)titleLabel;
- (UIView)bannerView;
- (double)titleTopOffset;
- (void)prepareForReuse;
- (void)setBannerView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelTopAnchorConstraint:(id)a3;
- (void)setTitleTopOffset:(double)a3;
- (void)updateConstraints;
@end

@implementation TVHCollectionViewSectionHeaderView

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView titleLabel](self, "titleLabel"));
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
      -[TVHCollectionViewSectionHeaderView setTitleLabel:](self, "setTitleLabel:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  6LL,  8LL));
      -[UILabel setFont:](v6, "setFont:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_90PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_90PercentWhiteColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v8,  v9));
      -[UILabel setTextColor:](v6, "setTextColor:", v10);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
      -[TVHCollectionViewSectionHeaderView addSubview:](self, "addSubview:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v6, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView leadingAnchor](self, "leadingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
      v15 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));

      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
    }

    -[UILabel setText:](v6, "setText:", v4);
    -[UILabel sizeToFit](v6, "sizeToFit");
    -[TVHCollectionViewSectionHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

  else
  {
    -[UILabel removeFromSuperview](v5, "removeFromSuperview");

    -[TVHCollectionViewSectionHeaderView setTitleLabel:](self, "setTitleLabel:", 0LL);
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setTitleTopOffset:(double)a3
{
  if (self->_titleTopOffset != a3)
  {
    self->_titleTopOffset = a3;
    -[TVHCollectionViewSectionHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)setBannerView:(id)a3
{
  v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    -[UIView removeFromSuperview](bannerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bannerView, a3);
    if (v5)
    {
      -[TVHCollectionViewSectionHeaderView addSubview:](self, "addSubview:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v5, "centerXAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView centerXAnchor](self, "centerXAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v15]);
      v17[0] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5, "widthAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView widthAnchor](self, "widthAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
      v17[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView topAnchor](self, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
      v17[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));

      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
    }

    -[TVHCollectionViewSectionHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHCollectionViewSectionHeaderView;
  -[TVHCollectionViewSectionHeaderView updateConstraints](&v14, "updateConstraints");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView titleLabelTopAnchorConstraint](self, "titleLabelTopAnchorConstraint"));
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v16 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v5);

    -[TVHCollectionViewSectionHeaderView setTitleLabelTopAnchorConstraint:]( self,  "setTitleLabelTopAnchorConstraint:",  0LL);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView titleLabel](self, "titleLabel"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView bannerView](self, "bannerView"));
    v8 = v7;
    if (v7) {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
    }
    else {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVHCollectionViewSectionHeaderView topAnchor](self, "topAnchor"));
    }
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 topAnchor]);
    -[TVHCollectionViewSectionHeaderView titleTopOffset](self, "titleTopOffset");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v10));

    -[TVHCollectionViewSectionHeaderView setTitleLabelTopAnchorConstraint:]( self,  "setTitleLabelTopAnchorConstraint:",  v12);
    uint64_t v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);

    id v4 = (void *)v12;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCollectionViewSectionHeaderView;
  -[TVHCollectionViewSectionHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[TVHCollectionViewSectionHeaderView setBannerView:](self, "setBannerView:", 0LL);
}

- (double)titleTopOffset
{
  return self->_titleTopOffset;
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTopAnchorConstraint
{
  return self->_titleLabelTopAnchorConstraint;
}

- (void)setTitleLabelTopAnchorConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end