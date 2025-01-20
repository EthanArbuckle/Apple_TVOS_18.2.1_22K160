@interface TVPSharedPSCommentsViewCell
+ (double)maxCellHeightWithTitle:(id)a3 subtitle:(id)a4 maxWidth:(double)a5;
- (NSString)commentCaption;
- (NSString)commentText;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setCommentCaption:(id)a3;
- (void)setCommentText:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVPSharedPSCommentsViewCell

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

  return v9 + 5.0;
}

- (void)setCommentText:(id)a3
{
  id v4 = a3;
  if (!self->_titleLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    id v7 = self->_titleLabel;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](v7, "setFont:", v8);

    double v9 = self->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:");
  }

  id v11 = [v4 length];
  double v12 = self->_titleLabel;
  if (v11)
  {
    -[UILabel setText:](v12, "setText:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (!v13)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSCommentsViewCell contentView](self, "contentView"));
      [v14 addSubview:self->_titleLabel];
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v12, "removeFromSuperview");
  }

  commentText = self->_commentText;
  self->_commentText = (NSString *)v4;

  -[TVPSharedPSCommentsViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCommentCaption:(id)a3
{
  id v4 = a3;
  if (!self->_subtitleLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    id v7 = self->_subtitleLabel;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](v7, "setFont:", v8);

    double v9 = self->_subtitleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVPThemeManager imageHeaderSubtitleColor]( &OBJC_CLASS___TVPThemeManager,  "imageHeaderSubtitleColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1LL);
  }

  id v11 = [v4 length];
  double v12 = self->_subtitleLabel;
  if (v11)
  {
    -[UILabel setText:](v12, "setText:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_subtitleLabel, "superview"));

    if (!v13)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSCommentsViewCell contentView](self, "contentView"));
      [v14 addSubview:self->_subtitleLabel];
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v12, "removeFromSuperview");
  }

  commentCaption = self->_commentCaption;
  self->_commentCaption = (NSString *)v4;

  -[TVPSharedPSCommentsViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPSharedPSCommentsViewCell;
  -[TVPSharedPSCommentsViewCell layoutSubviews](&v14, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSCommentsViewCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v6,  v7,  v5);
  double v9 = v8;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 0.0, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v10,  v11,  v5);
  double v13 = v12;

  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, v9 + 5.0, v5, v13);
}

- (NSString)commentText
{
  return self->_commentText;
}

- (NSString)commentCaption
{
  return self->_commentCaption;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end