@interface TVPSharedPSAlbumCreatorCell
+ (double)maxCellHeightWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5;
- (NSString)creatorName;
- (NSString)dateCreated;
- (UILabel)creatorNameLabel;
- (UILabel)dateCreatedLabel;
- (UIView)lineDivider;
- (void)layoutSubviews;
- (void)setCreatorName:(id)a3;
- (void)setCreatorNameLabel:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateCreatedLabel:(id)a3;
- (void)setLineDivider:(id)a3;
@end

@implementation TVPSharedPSAlbumCreatorCell

+ (double)maxCellHeightWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = 0.0;
  if (v7 && [v7 length])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v7,  v10,  a5);
    double v12 = v11;

    double v9 = v12 + 0.0;
  }

  if (v8 && [v8 length])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v8,  v13,  a5);
    double v15 = v14;

    double v9 = v9 + v15;
  }

  return v9 + 23.0;
}

- (void)setCreatorName:(id)a3
{
  id v4 = a3;
  if (!self->_creatorNameLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    creatorNameLabel = self->_creatorNameLabel;
    self->_creatorNameLabel = v5;

    id v7 = self->_creatorNameLabel;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](v7, "setFont:", v8);

    double v9 = self->_creatorNameLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_creatorNameLabel, "setNumberOfLines:");
  }

  id v11 = [v4 length];
  double v12 = self->_creatorNameLabel;
  if (v11)
  {
    -[UILabel setText:](v12, "setText:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_creatorNameLabel, "superview"));

    if (!v13) {
      -[TVPSharedPSAlbumCreatorCell addSubview:](self, "addSubview:", self->_creatorNameLabel);
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v12, "removeFromSuperview");
  }

  creatorName = self->_creatorName;
  self->_creatorName = (NSString *)v4;

  -[TVPSharedPSAlbumCreatorCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDateCreated:(id)a3
{
  id v4 = a3;
  if (!self->_dateCreatedLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    dateCreatedLabel = self->_dateCreatedLabel;
    self->_dateCreatedLabel = v5;

    id v7 = self->_dateCreatedLabel;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](v7, "setFont:", v8);

    double v9 = self->_dateCreatedLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVPThemeManager imageHeaderSubtitleColor]( &OBJC_CLASS___TVPThemeManager,  "imageHeaderSubtitleColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_dateCreatedLabel, "setNumberOfLines:", 1LL);
  }

  id v11 = [v4 length];
  double v12 = self->_dateCreatedLabel;
  if (v11)
  {
    -[UILabel setText:](v12, "setText:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_dateCreatedLabel, "superview"));

    if (!v13) {
      -[TVPSharedPSAlbumCreatorCell addSubview:](self, "addSubview:", self->_dateCreatedLabel);
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v12, "removeFromSuperview");
  }

  dateCreated = self->_dateCreated;
  self->_dateCreated = (NSString *)v4;

  -[TVPSharedPSAlbumCreatorCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVPSharedPSAlbumCreatorCell;
  -[TVPSharedPSAlbumCreatorCell layoutSubviews](&v18, "layoutSubviews");
  v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  lineDivider = self->_lineDivider;
  self->_lineDivider = v3;

  v5 = self->_lineDivider;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[TVPSharedPSAlbumCreatorCell addSubview:](self, "addSubview:", self->_lineDivider);
  -[TVPSharedPSAlbumCreatorCell bounds](self, "bounds");
  double v8 = v7;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_creatorNameLabel, "text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v9,  v10,  v8);
  double v12 = v11;

  -[UILabel setFrame:](self->_creatorNameLabel, "setFrame:", 0.0, 0.0, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_dateCreatedLabel, "text"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v13,  v14,  v8);
  double v16 = v15;

  double v17 = v12 + 5.0;
  -[UILabel setFrame:](self->_dateCreatedLabel, "setFrame:", 0.0, v17, v8, v16);
  -[UIView setFrame:](self->_lineDivider, "setFrame:", 0.0, v17 + v16 + 17.0, v8, 1.0);
}

- (NSString)creatorName
{
  return self->_creatorName;
}

- (NSString)dateCreated
{
  return self->_dateCreated;
}

- (UILabel)creatorNameLabel
{
  return self->_creatorNameLabel;
}

- (void)setCreatorNameLabel:(id)a3
{
}

- (UILabel)dateCreatedLabel
{
  return self->_dateCreatedLabel;
}

- (void)setDateCreatedLabel:(id)a3
{
}

- (UIView)lineDivider
{
  return self->_lineDivider;
}

- (void)setLineDivider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end