@interface TVPSharedPSActivitySupplementaryView
- (BOOL)isSharedStream;
- (NSString)batchDescription;
- (NSString)batchTitle;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setBatchDescription:(id)a3;
- (void)setBatchTitle:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setIsSharedStream:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVPSharedPSActivitySupplementaryView

- (void)setBatchTitle:(id)a3
{
  id v4 = a3;
  if (!self->_titleLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    v7 = self->_titleLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v11 = self->_titleLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1LL);
  }

  id v13 = [v4 length];
  v14 = self->_titleLabel;
  if (v13)
  {
    -[UILabel setText:](v14, "setText:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_titleLabel, "superview"));

    if (!v15) {
      -[TVPSharedPSActivitySupplementaryView addSubview:](self, "addSubview:", self->_titleLabel);
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v14, "removeFromSuperview");
  }

  batchTitle = self->_batchTitle;
  self->_batchTitle = (NSString *)v4;

  -[TVPSharedPSActivitySupplementaryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBatchDescription:(id)a3
{
  id v4 = a3;
  if (!self->_descriptionLabel)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    descriptionLabel = self->_descriptionLabel;
    self->_descriptionLabel = v5;

    v7 = self->_descriptionLabel;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_descriptionLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v11 = self->_descriptionLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 1LL);
  }

  id v13 = [v4 length];
  v14 = self->_descriptionLabel;
  if (v13)
  {
    -[UILabel setText:](v14, "setText:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](self->_descriptionLabel, "superview"));

    if (!v15) {
      -[TVPSharedPSActivitySupplementaryView addSubview:](self, "addSubview:", self->_descriptionLabel);
    }
  }

  else
  {
    -[UILabel removeFromSuperview](v14, "removeFromSuperview");
  }

  batchDescription = self->_batchDescription;
  self->_batchDescription = (NSString *)v4;

  -[TVPSharedPSActivitySupplementaryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivitySupplementaryView;
  -[TVPSharedPSActivitySupplementaryView layoutSubviews](&v21, "layoutSubviews");
  id v3 = -[TVPSharedPSActivitySupplementaryView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  -[TVPSharedPSActivitySupplementaryView bounds](self, "bounds");
  double v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v6,  v7,  v5);
  double v9 = v8;
  double v11 = v10;

  if (v3 == (id)1) {
    double v12 = v5 - v9;
  }
  else {
    double v12 = 0.0;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, 20.0, v9, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v13,  v14,  v5);
  double v16 = v15;
  double v18 = v17;

  if (self->_isSharedStream)
  {
    if (v3 == (id)1) {
      double v19 = v5 - v16;
    }
    else {
      double v19 = 0.0;
    }
    v22.origin.y = 20.0;
    v22.origin.x = v12;
    v22.size.width = v9;
    v22.size.height = v11;
    double v20 = CGRectGetMaxY(v22) + 2.0;
  }

  else
  {
    if (v3 == (id)1)
    {
      v23.origin.y = 20.0;
      v23.origin.x = v12;
      v23.size.width = v9;
      v23.size.height = v11;
      double v19 = CGRectGetMinX(v23) + -17.0 - v16;
    }

    else
    {
      double v19 = v9 + 17.0;
    }

    double v20 = 20.0;
  }

  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v19, v20, v16, v18);
}

- (NSString)batchTitle
{
  return self->_batchTitle;
}

- (NSString)batchDescription
{
  return self->_batchDescription;
}

- (BOOL)isSharedStream
{
  return self->_isSharedStream;
}

- (void)setIsSharedStream:(BOOL)a3
{
  self->_isSharedStream = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end