@interface TVHCatalogueListViewCell
- (NSString)title;
- (TVHCatalogueListViewCell)initWithFrame:(CGRect)a3;
- (UIColor)mediaEntitiesCountLabelFocusedDynamicColor;
- (UIColor)mediaEntitiesCountLabelUnfocusedDynamicColor;
- (UIColor)titleLabelFocusedDynamicColor;
- (UIColor)titleLabelUnfocusedDynamicColor;
- (UILabel)mediaEntitiesCountLabel;
- (UILabel)titleLabel;
- (unint64_t)mediaEntitiesCount;
- (void)_updateColors;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setMediaEntitiesCount:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVHCatalogueListViewCell

- (TVHCatalogueListViewCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v36,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](v3, "floatingContentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contentView]);

    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    v9 = v4->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1LL);
    v11 = v4->_titleLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4LL);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4LL);
    [v6 addSubview:v4->_titleLabel];
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v13,  v14));
    titleLabelUnfocusedDynamicColor = v4->_titleLabelUnfocusedDynamicColor;
    v4->_titleLabelUnfocusedDynamicColor = (UIColor *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v17,  v18));
    titleLabelFocusedDynamicColor = v4->_titleLabelFocusedDynamicColor;
    v4->_titleLabelFocusedDynamicColor = (UIColor *)v19;

    v21 = objc_alloc_init(&OBJC_CLASS___UILabel);
    mediaEntitiesCountLabel = v4->_mediaEntitiesCountLabel;
    v4->_mediaEntitiesCountLabel = v21;

    v23 = v4->_mediaEntitiesCountLabel;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 9LL));
    -[UILabel setFont:](v23, "setFont:", v24);

    -[UILabel setNumberOfLines:](v4->_mediaEntitiesCountLabel, "setNumberOfLines:", 1LL);
    -[UILabel setLineBreakMode:](v4->_mediaEntitiesCountLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v4->_mediaEntitiesCountLabel, "setTextAlignment:", 4LL);
    v25 = v4->_mediaEntitiesCountLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v25, "setBackgroundColor:", v26);

    [v6 addSubview:v4->_mediaEntitiesCountLabel];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_30PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_30PercentWhiteColor"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v27,  v28));
    mediaEntitiesCountLabelUnfocusedDynamicColor = v4->_mediaEntitiesCountLabelUnfocusedDynamicColor;
    v4->_mediaEntitiesCountLabelUnfocusedDynamicColor = (UIColor *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v31,  v32));
    mediaEntitiesCountLabelFocusedDynamicColor = v4->_mediaEntitiesCountLabelFocusedDynamicColor;
    v4->_mediaEntitiesCountLabelFocusedDynamicColor = (UIColor *)v33;

    -[TVHCatalogueListViewCell _updateColors](v4, "_updateColors");
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell title](self, "title"));
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabel](self, "titleLabel"));
    [v6 setText:v7];

    -[TVHCatalogueListViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setMediaEntitiesCount:(unint64_t)a3
{
  if (self->_mediaEntitiesCount != a3)
  {
    self->_mediaEntitiesCount = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
      id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tvhk_localizedDisplayString"));
    }

    else
    {
      id v6 = 0LL;
    }

    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell mediaEntitiesCountLabel](self, "mediaEntitiesCountLabel"));
    [v5 setText:v6];

    -[TVHCatalogueListViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewCell;
  -[TVHListViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHCatalogueListViewCell setTitle:](self, "setTitle:", 0LL);
  -[TVHCatalogueListViewCell setMediaEntitiesCount:](self, "setMediaEntitiesCount:", 0LL);
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewCell;
  -[TVHListViewCell layoutSubviews](&v14, "layoutSubviews");
  -[TVHCatalogueListViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = floor((v5 + -46.0) * 0.5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell mediaEntitiesCountLabel](self, "mediaEntitiesCountLabel"));
  [v7 sizeToFit];
  [v7 frame];
  double v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabel](self, "titleLabel"));
  if (-[TVHCatalogueListViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    v15.size.height = 46.0;
    double v11 = 20.0;
    v15.origin.x = 20.0;
    v15.origin.y = v6;
    v15.size.width = v9;
    double v12 = CGRectGetMaxX(v15) + 20.0;
    double v13 = v4 - v12 + -20.0;
  }

  else
  {
    double v11 = v4 + -20.0 - v9;
    double v13 = v11 + -40.0;
    double v12 = 20.0;
  }

  objc_msgSend(v7, "setFrame:", v11, v6, v9, 46.0);
  objc_msgSend(v10, "setFrame:", v12, v6, v13, 46.0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHCatalogueListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100038C80;
  v8[3] = &unk_1000FCEA8;
  v8[4] = self;
  [v6 addCoordinatedAnimations:v8 completion:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHCatalogueListViewCell isFocused](self, "isFocused"));
}

- (void)_updateColors
{
  if (-[TVHCatalogueListViewCell isFocused](self, "isFocused"))
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabelFocusedDynamicColor](self, "titleLabelFocusedDynamicColor"));
    uint64_t v3 = objc_claimAutoreleasedReturnValue( -[TVHCatalogueListViewCell mediaEntitiesCountLabelFocusedDynamicColor]( self,  "mediaEntitiesCountLabelFocusedDynamicColor"));
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabelUnfocusedDynamicColor](self, "titleLabelUnfocusedDynamicColor"));
    uint64_t v3 = objc_claimAutoreleasedReturnValue( -[TVHCatalogueListViewCell mediaEntitiesCountLabelUnfocusedDynamicColor]( self,  "mediaEntitiesCountLabelUnfocusedDynamicColor"));
  }

  double v4 = (void *)v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell titleLabel](self, "titleLabel"));
  [v5 setTextColor:v7];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCatalogueListViewCell mediaEntitiesCountLabel](self, "mediaEntitiesCountLabel"));
  [v6 setTextColor:v4];
}

- (unint64_t)mediaEntitiesCount
{
  return self->_mediaEntitiesCount;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIColor)titleLabelFocusedDynamicColor
{
  return self->_titleLabelFocusedDynamicColor;
}

- (UIColor)titleLabelUnfocusedDynamicColor
{
  return self->_titleLabelUnfocusedDynamicColor;
}

- (UILabel)mediaEntitiesCountLabel
{
  return self->_mediaEntitiesCountLabel;
}

- (UIColor)mediaEntitiesCountLabelFocusedDynamicColor
{
  return self->_mediaEntitiesCountLabelFocusedDynamicColor;
}

- (UIColor)mediaEntitiesCountLabelUnfocusedDynamicColor
{
  return self->_mediaEntitiesCountLabelUnfocusedDynamicColor;
}

- (void).cxx_destruct
{
}

@end