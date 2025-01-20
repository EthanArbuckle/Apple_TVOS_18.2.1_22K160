@interface TVMusicLibraryCollectionViewCell
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)canBecomeFocused;
- (BOOL)isExplicit;
- (BOOL)isGreyedOut;
- (BOOL)showFavoriteIndicator;
- (CGRect)_frameForImageView:(id)a3;
- (CGRect)visibleFrame;
- (CGSize)_currentImageViewSize;
- (MPArtworkCatalog)artworkCatalog;
- (NSString)subTitle;
- (NSString)title;
- (TVMusicLibraryCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)placeholderImage;
- (UIImageView)imageView;
- (double)maximumImageHeight;
- (id)_addSubheadLabelWithFont:(id)a3 textColor:(id)a4;
- (id)_decoratedTitleString;
- (int64_t)imageShape;
- (void)_adjustFrameForImageView:(id)a3;
- (void)_setLabelPositionsChangeY:(BOOL)a3;
- (void)_setLabelTextColors;
- (void)_setLabelTextColorsForUserInterfaceStyle:(int64_t)a3;
- (void)_setSizeForLabel:(id)a3;
- (void)_showImage:(id)a3 animated:(BOOL)a4;
- (void)_updateLayeredImage;
- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setArtworkCatalog:(id)a3 withFittingSize:(CGSize)a4;
- (void)setGreyedOut:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageShape:(int64_t)a3;
- (void)setImageView:(id)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setMaximumImageHeight:(double)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setShowFavoriteIndicator:(BOOL)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicLibraryCollectionViewCell

- (TVMusicLibraryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  v3 = -[TVMusicLibraryCollectionViewCell initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMusicLibraryCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_imageShape = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](v3, "contentView"));
    [v5 bounds];
    double v7 = v6;

    v8 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", 0.0, 0.0, v7, v7);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1LL);
    -[UIImageView setAdjustsImageWhenAncestorFocused:](v3->_imageView, "setAdjustsImageWhenAncestorFocused:", 1LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](v3, "contentView"));
    [v10 addSubview:v3->_imageView];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutFont](&OBJC_CLASS___TVThemeManager, "calloutFont"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCell _addSubheadLabelWithFont:textColor:]( v3,  "_addSubheadLabelWithFont:textColor:",  v11,  v12));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v13;

    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v3->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 2LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutFont](&OBJC_CLASS___TVThemeManager, "calloutFont"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityCColor](&OBJC_CLASS___TVThemeManager, "textOpacityCColor"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCell _addSubheadLabelWithFont:textColor:]( v3,  "_addSubheadLabelWithFont:textColor:",  v15,  v16));
    subTitleLabel = v3->_subTitleLabel;
    v3->_subTitleLabel = (UILabel *)v17;

    -[UILabel setLineBreakMode:](v3->_subTitleLabel, "setLineBreakMode:", 4LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](v3, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 layer]);
    [v20 setAllowsGroupBlending:0];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell traitCollection](v3, "traitCollection"));
    -[TVMusicLibraryCollectionViewCell _updateColorsForUserInterfaceStyle:]( v3,  "_updateColorsForUserInterfaceStyle:",  [v21 userInterfaceStyle]);
  }

  return v3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  titleLabel = self->_titleLabel;
  if (a3) {
    double v6 = 0.9;
  }
  else {
    double v6 = 0.0;
  }
  -[UILabel setAdjustsFontSizeToFitWidth:](titleLabel, "setAdjustsFontSizeToFitWidth:");
  -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", v6);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_subTitleLabel, "setAdjustsFontSizeToFitWidth:", v3);
  -[UILabel setMinimumScaleFactor:](self->_subTitleLabel, "setMinimumScaleFactor:", v6);
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return -[UILabel adjustsFontSizeToFitWidth](self->_titleLabel, "adjustsFontSizeToFitWidth");
}

- (void)setShowFavoriteIndicator:(BOOL)a3
{
  if (self->_showFavoriteIndicator != a3)
  {
    self->_showFavoriteIndicator = a3;
    -[TVMusicLibraryCollectionViewCell setTitle:](self, "setTitle:", self->_title);
  }

- (id)_decoratedTitleString
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](self->_titleLabel, "textColor"));
  if (-[TVMusicLibraryCollectionViewCell isExplicit](self, "isExplicit")) {
    v4 = (NSString *)objc_claimAutoreleasedReturnValue( +[TVMusicLibraryUtilities stringWithAppendedExplicitIndicator:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "stringWithAppendedExplicitIndicator:",  self->_title));
  }
  else {
    v4 = self->_title;
  }
  v5 = v4;
  double v6 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v4);
  if (-[TVMusicLibraryCollectionViewCell showFavoriteIndicator](self, "showFavoriteIndicator"))
  {
    double v7 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  @" ");
    -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v7);

    v8 = objc_opt_new(&OBJC_CLASS___NSTextAttachment);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  17.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"star.fill",  v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 imageWithTintColor:v3]);
    -[NSTextAttachment setImage:](v8, "setImage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSTextAttachment image](v8, "image"));
    [v12 size];
    double v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSTextAttachment image](v8, "image"));
    [v15 size];
    -[NSTextAttachment setBounds:](v8, "setBounds:", 0.0, 1.0, v14, v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v8));
    -[NSMutableAttributedString appendAttributedString:](v6, "appendAttributedString:", v17);
  }

  v21[0] = NSFontAttributeName;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v21[1] = NSForegroundColorAttributeName;
  v22[0] = v18;
  v22[1] = v3;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  -[NSMutableAttributedString addAttributes:range:]( v6,  "addAttributes:range:",  v19,  0LL,  -[NSMutableAttributedString length](v6, "length"));

  return v6;
}

- (CGRect)visibleFrame
{
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if (-[TVMusicLibraryCollectionViewCell isFocused](self, "isFocused"))
  {
    -[UIImageView frame](self->_imageView, "frame");
    if (v11 != 0.0)
    {
      -[UIImageView frame](self->_imageView, "frame");
      if (v12 != 0.0)
      {
        -[UIImageView frame](self->_imageView, "frame");
        double v14 = v13;
        -[UIImageView frame](self->_imageView, "frame");
        double v16 = v14 / v15;
        if (v14 / v15 <= 1.0)
        {
          double v18 = v16 * -30.0;
          double v17 = -30.0;
        }

        else
        {
          double v17 = -30.0 / v16;
          double v18 = -30.0;
        }

        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectInset(v23, v18, v17);
        CGRect v25 = CGRectIntegral(v24);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
      }
    }
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)setArtworkCatalog:(id)a3 withFittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  objc_msgSend(v7, "setFittingSize:", width, height);
  -[TVMusicLibraryCollectionViewCell setArtworkCatalog:](self, "setArtworkCatalog:", v7);
}

- (void)setArtworkCatalog:(id)a3
{
  id v5 = a3;
  -[TVMusicLibraryCollectionViewCell clearArtworkCatalogs](self, "clearArtworkCatalogs");
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell placeholderImage](self, "placeholderImage"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
  [v7 setImage:v6];

  if (v5)
  {
    objc_initWeak(&location, v5);
    char v8 = [v5 hasImageOnDisk] ^ 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100073260;
    v9[3] = &unk_10026BB88;
    objc_copyWeak(&v10, &location);
    char v11 = v8;
    [v5 setDestination:self configurationBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  else
  {
    -[TVMusicLibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_showImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    double v12 = sub_1000733D8;
    double v13 = &unk_100268B30;
    double v14 = self;
    id v15 = v6;
    +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  self,  5242880LL,  &v10,  0LL,  0.24);
  }

  else
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
    [v8 setImage:v7];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
    -[TVMusicLibraryCollectionViewCell _adjustFrameForImageView:](self, "_adjustFrameForImageView:", v9);
  }

  -[TVMusicLibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v10, v11, v12, v13, v14);
}

- (void)setPlaceholderImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    uint64_t v11 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue([v6 image]);
    placeholderImage = self->_placeholderImage;

    if (v7 == placeholderImage)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
      [v9 setImage:v11];
    }

    objc_storeStrong((id *)&self->_placeholderImage, a3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
    -[TVMusicLibraryCollectionViewCell _adjustFrameForImageView:](self, "_adjustFrameForImageView:", v10);

    -[TVMusicLibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    -[TVMusicLibraryCollectionViewCell _updateLayeredImage](self, "_updateLayeredImage");
    id v5 = v11;
  }
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell _decoratedTitleString](self, "_decoratedTitleString"));
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v5);

  -[TVMusicLibraryCollectionViewCell _setSizeForLabel:](self, "_setSizeForLabel:", self->_titleLabel);
}

- (void)setSubTitle:(id)a3
{
  id v5 = a3;
  -[UILabel setText:](self->_subTitleLabel, "setText:", v5);
  -[TVMusicLibraryCollectionViewCell _setSizeForLabel:](self, "_setSizeForLabel:", self->_subTitleLabel);
}

- (void)setImageShape:(int64_t)a3
{
  if (self->_imageShape != a3)
  {
    self->_imageShape = a3;
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      uint64_t v4 = 2LL;
    }
    else {
      uint64_t v4 = 1LL;
    }
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell imageView](self, "imageView"));
      -[TVMusicLibraryCollectionViewCell _adjustFrameForImageView:](self, "_adjustFrameForImageView:", v6);

      -[TVMusicLibraryCollectionViewCell _updateLayeredImage](self, "_updateLayeredImage");
    }

    -[TVMusicLibraryCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)_updateLayeredImage
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _layeredImageContainer](self->_imageView, "_layeredImageContainer"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v3 config]);

  [v8 setScaleSizeIncrease:60.0];
  double v4 = 12.0;
  if (self->_imageShape == 3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](self, "contentView"));
    [v5 bounds];
    double v4 = v6 * 0.5;

    [v8 setDefaultUnfocusedShadowRadius:20.0];
    [v8 setDefaultFocusedShadowRadius:20.0];
    [v8 setDefaultUnfocusedShadowOpacity:0.1];
    [v8 setDefaultFocusedShadowOpacity:0.2];
  }

  -[UIImageView _setLayeredImageCornerRadius:](self->_imageView, "_setLayeredImageCornerRadius:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _layeredImageContainer](self->_imageView, "_layeredImageContainer"));
  [v7 setConfig:v8];

  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 0LL);
}

- (void)setIsExplicit:(BOOL)a3
{
  if (self->_isExplicit != a3)
  {
    self->_isExplicit = a3;
    -[TVMusicLibraryCollectionViewCell setTitle:](self, "setTitle:", self->_title);
  }

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  -[TVMusicLibraryCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[TVMusicLibraryCollectionViewCell clearArtworkCatalogs](self, "clearArtworkCatalogs");
  -[UIImageView setImage:](self->_imageView, "setImage:", 0LL);
  -[UILabel setText:](self->_titleLabel, "setText:", 0LL);
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", 0LL);
  -[UILabel setText:](self->_subTitleLabel, "setText:", 0LL);
  artworkCatalog = self->_artworkCatalog;
  self->_artworkCatalog = 0LL;

  self->_showFavoriteIndicator = 0;
  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = 0LL;

  -[TVMusicLibraryCollectionViewCell _setLabelTextColors](self, "_setLabelTextColors");
  -[TVMusicLibraryCollectionViewCell setIsExplicit:](self, "setIsExplicit:", 0LL);
  -[TVMusicLibraryCollectionViewCell setImageShape:](self, "setImageShape:", 0LL);
  -[TVMusicLibraryCollectionViewCell setMaximumImageHeight:](self, "setMaximumImageHeight:", 0.0);
  -[TVMusicLibraryCollectionViewCell setGreyedOut:](self, "setGreyedOut:", 0LL);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  -[TVMusicLibraryCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  -[TVMusicLibraryCollectionViewCell _setLabelPositionsChangeY:](self, "_setLabelPositionsChangeY:", 1LL);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  -[TVMusicLibraryCollectionViewCell setHighlighted:](&v5, "setHighlighted:");
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:", v3);
}

- (id)_addSubheadLabelWithFont:(id)a3 textColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setFont:](v8, "setFont:", v7);

  -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1LL);
  -[UILabel setTextColor:](v8, "setTextColor:", v6);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](self, "contentView"));
  [v10 addSubview:v8];

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  id v6 = a4;
  -[TVMusicLibraryCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  -[TVMusicLibraryCollectionViewCell _setLabelPositionsChangeY:](self, "_setLabelPositionsChangeY:", 0LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100073B90;
  v7[3] = &unk_100268CF0;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicLibraryCollectionViewCell;
  id v4 = a3;
  -[TVMusicLibraryCollectionViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryCollectionViewCell traitCollection]( self,  "traitCollection",  v9.receiver,  v9.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell traitCollection](self, "traitCollection"));
    -[TVMusicLibraryCollectionViewCell _updateColorsForUserInterfaceStyle:]( self,  "_updateColorsForUserInterfaceStyle:",  [v8 userInterfaceStyle]);
  }

- (void)_adjustFrameForImageView:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 image]);

  if (v4)
  {
    -[TVMusicLibraryCollectionViewCell _frameForImageView:](self, "_frameForImageView:", v5);
    objc_msgSend(v5, "setFrame:");
  }
}

- (CGRect)_frameForImageView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 image]);
    [v6 size];
    double width = v7;
    double height = v9;
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell contentView](self, "contentView"));
  [v11 bounds];
  double v13 = v12;

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  -[TVMusicLibraryCollectionViewCell maximumImageHeight](self, "maximumImageHeight");
  if (v16 == 0.0) {
    double v17 = v13;
  }
  else {
    double v17 = v16;
  }
  if ((id)-[TVMusicLibraryCollectionViewCell imageShape](self, "imageShape") != (id)3 && width > 0.0 && height > 0.0)
  {
    if ((id)-[TVMusicLibraryCollectionViewCell imageShape](self, "imageShape") == (id)1)
    {
      double v18 = floor(v13 / 1.77777778);
      double v19 = v17 * 1.77777778;
    }

    else
    {
      double v18 = floor(height * v13 / width);
      double v19 = width * v17 / height;
    }

    double v20 = floor(v19);
    if (v18 <= v17) {
      double v20 = v13;
    }
    else {
      double v18 = v17;
    }
    double x = floor((v13 - v20) * 0.5);
    double y = fmax(v17 - v18, 0.0);
    double v17 = v18;
    double v13 = v20;
  }

  double v21 = x;
  double v22 = y;
  double v23 = v13;
  double v24 = v17;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)_setLabelPositionsChangeY:(BOOL)a3
{
  BOOL v3 = a3;
  -[UILabel frame](self->_titleLabel, "frame");
  double v6 = v5;
  double v8 = v7;
  -[TVMusicLibraryCollectionViewCell _currentImageViewSize](self, "_currentImageViewSize");
  double v10 = v9;
  double v12 = v11;
  double v20 = self->_imageView;
  -[UIImageView frame](v20, "frame");
  double v14 = v13;
  -[UIImageView frame](v20, "frame");
  double v16 = v15;
  if (v3)
  {
    -[UIImageView frame](v20, "frame");
    double v18 = ceil((v12 - v17) * 0.5) + 4.0;
    -[UIImageView frame](v20, "frame");
    double v6 = CGRectGetMaxY(v21) + v18;
  }

  double v19 = v16 - floor((v10 - v14) * 0.5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, v6, v10, v8);
  -[UILabel frame](self->_subTitleLabel, "frame");
  -[UILabel setFrame:](self->_subTitleLabel, "setFrame:", v19, v8 + -10.0 + v6, v10, CGRectGetHeight(v22));
}

- (CGSize)_currentImageViewSize
{
  double v4 = v3;
  double v6 = v5;
  if (-[TVMusicLibraryCollectionViewCell isFocused](self, "isFocused"))
  {
    if (v6 <= v4)
    {
      double v8 = v6 + v6 / v4 * 60.0;
      double v4 = v4 + 60.0;
      double v6 = ceil(v8);
    }

    else
    {
      double v7 = v4 + v4 / v6 * 60.0;
      double v6 = v6 + 60.0;
      double v4 = ceil(v7);
    }
  }

  double v9 = v4;
  double v10 = v6;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)_setSizeForLabel:(id)a3
{
  id v11 = a3;
  [v11 sizeToFit];
  [v11 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  -[TVMusicLibraryCollectionViewCell _currentImageViewSize](self, "_currentImageViewSize");
  objc_msgSend(v11, "setFrame:", v5, v7, v10, v9 + 10.0);
}

- (void)_setLabelTextColors
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicLibraryCollectionViewCell traitCollection](self, "traitCollection"));
  -[TVMusicLibraryCollectionViewCell _setLabelTextColorsForUserInterfaceStyle:]( self,  "_setLabelTextColorsForUserInterfaceStyle:",  [v3 userInterfaceStyle]);
}

- (void)_setLabelTextColorsForUserInterfaceStyle:(int64_t)a3
{
  if (-[TVMusicLibraryCollectionViewCell isFocused](self, "isFocused", a3))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  }

  else if (-[TVMusicLibraryCollectionViewCell isGreyedOut](self, "isGreyedOut"))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityDColor](&OBJC_CLASS___TVThemeManager, "textOpacityDColor"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityDColor](&OBJC_CLASS___TVThemeManager, "textOpacityDColor"));
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityBColor](&OBJC_CLASS___TVThemeManager, "textOpacityBColor"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[TVThemeManager textOpacityCColor](&OBJC_CLASS___TVThemeManager, "textOpacityCColor"));
  }

  double v5 = (void *)v4;
  -[UILabel setTextColor:](self->_subTitleLabel, "setTextColor:", v4);

  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v8);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_titleLabel, "attributedText"));
  id v7 = [v6 length];

  if (v7) {
    -[TVMusicLibraryCollectionViewCell setTitle:](self, "setTitle:", self->_title);
  }
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  if (a4)
  {
    id v4 = a3;
    double width = 0.0;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
    [v4 setShadowColor:v6];

    double height = 2.0;
    double v8 = 6.0;
  }

  else
  {
    [a3 setShadowColor:0];
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    double v8 = 0.0;
  }

  objc_msgSend(a3, "setShadowOffset:", width, height);
  [a3 setShadowBlur:v8];
}

- (int64_t)imageShape
{
  return self->_imageShape;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (double)maximumImageHeight
{
  return self->_maximumImageHeight;
}

- (void)setMaximumImageHeight:(double)a3
{
  self->_maximumImageHeight = a3;
}

- (BOOL)isGreyedOut
{
  return self->_greyedOut;
}

- (void)setGreyedOut:(BOOL)a3
{
  self->_greyedOut = a3;
}

- (BOOL)showFavoriteIndicator
{
  return self->_showFavoriteIndicator;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end