@interface TVPPhotoLibraryCollectionsHeaderView
- (BOOL)animateTitleForFocus;
- (BOOL)isTitleCenterAligned;
- (CGSize)_getAttributedStringSizeForText:(id)a3 font:(id)a4;
- (NSString)collectionTitle;
- (TVPPhotoLibraryCollectionsHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)collectionTitleLabel;
- (void)layoutSubviews;
- (void)setAnimateTitleForFocus:(BOOL)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setCollectionTitleLabel:(id)a3;
- (void)setTitleCenterAligned:(BOOL)a3;
@end

@implementation TVPPhotoLibraryCollectionsHeaderView

- (TVPPhotoLibraryCollectionsHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryCollectionsHeaderView;
  v3 = -[TVPPhotoLibraryCollectionsHeaderView initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVPPhotoLibraryCollectionsHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);
  }

  return v3;
}

- (void)setCollectionTitle:(id)a3
{
  id v17 = a3;
  objc_storeStrong((id *)&self->_collectionTitle, a3);
  NSUInteger v5 = -[NSString length](self->_collectionTitle, "length");
  collectionTitleLabel = self->_collectionTitleLabel;
  if (v5)
  {
    if (!collectionTitleLabel)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
      v8 = self->_collectionTitleLabel;
      self->_collectionTitleLabel = v7;

      v9 = self->_collectionTitleLabel;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
      -[UILabel setFont:](v9, "setFont:", v10);

      v11 = self->_collectionTitleLabel;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

      v13 = self->_collectionTitleLabel;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
      -[UILabel setTextColor:](v13, "setTextColor:", v14);

      -[UILabel setLineBreakMode:](self->_collectionTitleLabel, "setLineBreakMode:", 4LL);
      collectionTitleLabel = self->_collectionTitleLabel;
    }

    -[UILabel setText:](collectionTitleLabel, "setText:", self->_collectionTitle);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_collectionTitleLabel, "superview"));

    if (!v15) {
      -[TVPPhotoLibraryCollectionsHeaderView addSubview:](self, "addSubview:", self->_collectionTitleLabel);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](collectionTitleLabel, "superview"));

    if (v16) {
      -[UILabel removeFromSuperview](self->_collectionTitleLabel, "removeFromSuperview");
    }
  }

  -[TVPPhotoLibraryCollectionsHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryCollectionsHeaderView;
  -[TVPPhotoLibraryCollectionsHeaderView layoutSubviews](&v24, "layoutSubviews");
  -[TVPPhotoLibraryCollectionsHeaderView frame](self, "frame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_collectionTitleLabel, "text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title2Font](&OBJC_CLASS___TVPThemeManager, "title2Font"));
  -[TVPPhotoLibraryCollectionsHeaderView _getAttributedStringSizeForText:font:]( self,  "_getAttributedStringSizeForText:font:",  v11,  v12);
  double v14 = v13;
  double v16 = v15;

  if (-[TVPPhotoLibraryCollectionsHeaderView animateTitleForFocus](self, "animateTitleForFocus")) {
    -[TVPPhotoLibraryCollectionsHeaderView setFrame:](self, "setFrame:", v4, v6 + -27.0, v8, v10);
  }
  unsigned int v17 = -[TVPPhotoLibraryCollectionsHeaderView isTitleCenterAligned](self, "isTitleCenterAligned");
  -[TVPPhotoLibraryCollectionsHeaderView bounds](self, "bounds");
  if (v17)
  {
    float v20 = (v18 - v14) * 0.5;
    double v21 = floorf(v20);
    -[TVPPhotoLibraryCollectionsHeaderView bounds](self, "bounds");
    double v22 = -20.0;
  }

  else
  {
    double v21 = 0.0;
    double v22 = 42.0;
  }

  float v23 = (v19 - v16) * 0.5;
  -[UILabel setFrame:](self->_collectionTitleLabel, "setFrame:", v21, v22 + floorf(v23), v14, v16);
}

- (CGSize)_getAttributedStringSizeForText:(id)a3 font:(id)a4
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  a4,  NSFontAttributeName,  0LL));
  [v5 sizeWithAttributes:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (BOOL)isTitleCenterAligned
{
  return self->_titleCenterAligned;
}

- (void)setTitleCenterAligned:(BOOL)a3
{
  self->_titleCenterAligned = a3;
}

- (BOOL)animateTitleForFocus
{
  return self->_animateTitleForFocus;
}

- (void)setAnimateTitleForFocus:(BOOL)a3
{
  self->_animateTitleForFocus = a3;
}

- (UILabel)collectionTitleLabel
{
  return self->_collectionTitleLabel;
}

- (void)setCollectionTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end