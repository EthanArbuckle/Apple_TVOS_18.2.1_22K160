@interface TVMusicAudioButton
+ (id)_imageNamed:(id)a3 withHeight:(double)a4;
+ (id)hiResLosslessButton;
+ (id)losslessButton;
+ (id)spatialButton;
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (TVMusicAudioButton)init;
- (TVMusicAudioButton)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)label;
- (double)borderThickness;
- (double)textYOffset;
- (int64_t)buttonType;
- (void)_configureWithText:(id)a3 imageName:(id)a4 contentColor:(id)a5;
- (void)_updateContentForCurrentState;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setBorderColor:(id)a3 forControlState:(unint64_t)a4;
- (void)setBorderThickness:(double)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 withTintColor:(id)a4 forControlState:(unint64_t)a5;
- (void)setSelected:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 withColor:(id)a4 forControlState:(unint64_t)a5;
- (void)setTextYOffset:(double)a3;
@end

@implementation TVMusicAudioButton

- (TVMusicAudioButton)init
{
  return -[TVMusicAudioButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 36.0, 36.0);
}

- (TVMusicAudioButton)initWithFrame:(CGRect)a3
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___TVMusicAudioButton;
  v3 = -[TVMusicFloatingButton initWithFrame:]( &v50,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    textForControlStates = v3->_textForControlStates;
    v3->_textForControlStates = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    textColorsForControlStates = v3->_textColorsForControlStates;
    v3->_textColorsForControlStates = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    imagesForControlStates = v3->_imagesForControlStates;
    v3->_imagesForControlStates = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    imageColorsForControlStates = v3->_imageColorsForControlStates;
    v3->_imageColorsForControlStates = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
    borderColorsForControlStates = v3->_borderColorsForControlStates;
    v3->_borderColorsForControlStates = (NSMutableDictionary *)v12;

    -[TVMusicAudioButton bounds](v3, "bounds");
    -[TVMusicFloatingButton setCornerRadius:](v3, "setCornerRadius:", v14 * 0.5);
    -[TVMusicAudioButton setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 0LL);
    -[TVMusicAudioButton setTranslatesAutoresizingMaskIntoConstraints:]( v3,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v15 = objc_alloc(&OBJC_CLASS___UIStackView);
    -[TVMusicAudioButton bounds](v3, "bounds");
    v16 = -[UIStackView initWithFrame:](v15, "initWithFrame:");
    stackView = v3->_stackView;
    v3->_stackView = v16;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_stackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 0LL);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 3LL);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 6.0);
    -[UIStackView setLayoutMargins:](v3->_stackView, "setLayoutMargins:", 0.0, 13.0, 0.0, 13.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v3->_stackView, "setLayoutMarginsRelativeArrangement:", 1LL);
    v18 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v18;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 4LL);
    -[UIImageView setHidden:](v3->_imageView, "setHidden:", 1LL);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_imageView);
    v20 = objc_alloc(&OBJC_CLASS___UILabel);
    -[TVMusicAudioButton bounds](v3, "bounds");
    v21 = -[UILabel initWithFrame:](v20, "initWithFrame:");
    label = v3->_label;
    v3->_label = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v3->_label, "heightAnchor"));
    -[TVMusicAudioButton frame](v3, "frame");
    v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToConstant:v24]);
    [v25 setActive:1];

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 fontWithSize:21.0]);
    -[UILabel setFont:](v3->_label, "setFont:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v28);

    -[UILabel setHidden:](v3->_label, "setHidden:", 1LL);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_label);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v3, "contentView"));
    [v29 addSubview:v3->_stackView];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_stackView, "centerXAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v3, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 centerXAnchor]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v32]);
    [v33 setActive:1];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v3, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 centerYAnchor]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v36]);
    [v37 setActive:1];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v3, "contentView"));
    [v38 setBackgroundColor:0];

    -[TVMusicAudioButton setBackgroundColor:](v3, "setBackgroundColor:", 0LL);
    -[UILabel setOpaque:](v3->_label, "setOpaque:", 0LL);
    v39 = objc_alloc(&OBJC_CLASS____TVMRoundRectView);
    -[TVMusicAudioButton bounds](v3, "bounds");
    v40 = -[_TVMRoundRectView initWithFrame:](v39, "initWithFrame:");
    roundRectView = v3->_roundRectView;
    v3->_roundRectView = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](v3->_label, "textColor"));
    -[_TVMRoundRectView setColor:](v3->_roundRectView, "setColor:", v42);

    -[_TVMRoundRectView setAutoresizingMask:](v3->_roundRectView, "setAutoresizingMask:", 18LL);
    -[TVMusicAudioButton setBorderThickness:](v3, "setBorderThickness:", 2.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMRoundRectView color](v3->_roundRectView, "color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3->_borderColorsForControlStates,  "setObject:forKeyedSubscript:",  v43,  &off_100281580);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton contentView](v3, "contentView"));
    [v44 addSubview:v3->_roundRectView];

    uint64_t v45 = kCAFilterPlusL;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioButton layer](v3, "layer"));
    [v46 setCompositingFilter:v45];

    -[UIStackView frame](v3->_stackView, "frame");
    v3->_stackViewSize.width = v47;
    v3->_stackViewSize.height = v48;
  }

  return v3;
}

- (void)setTextYOffset:(double)a3
{
  self->_textYOffset = a3;
  CGAffineTransformMakeTranslation(&v6, 0.0, a3);
  label = self->_label;
  CGAffineTransform v5 = v6;
  -[UILabel setTransform:](label, "setTransform:", &v5);
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicAudioButton;
  -[TVMusicFloatingButton setSelected:](&v4, "setSelected:", a3);
  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (void)setText:(id)a3 withColor:(id)a4 forControlState:(unint64_t)a5
{
  id v13 = a4;
  textForControlStates = self->_textForControlStates;
  id v9 = a3;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](textForControlStates, "setObject:forKeyedSubscript:", v9, v10);

  textColorsForControlStates = self->_textColorsForControlStates;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( textColorsForControlStates,  "setObject:forKeyedSubscript:",  v13,  v12);

  if (!a5) {
    -[_TVMRoundRectView setColor:](self->_roundRectView, "setColor:", v13);
  }
  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (void)setImage:(id)a3 withTintColor:(id)a4 forControlState:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (v14 && v8 && [v14 renderingMode] != (id)2)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v14 imageWithRenderingMode:2]);

    id v14 = (id)v9;
  }

  imagesForControlStates = self->_imagesForControlStates;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](imagesForControlStates, "setObject:forKeyedSubscript:", v14, v11);

  imageColorsForControlStates = self->_imageColorsForControlStates;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( imageColorsForControlStates,  "setObject:forKeyedSubscript:",  v8,  v13);

  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (void)setText:(id)a3
{
  id v4 = a3;
  CGAffineTransform v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_textForControlStates,  "objectForKeyedSubscript:",  &off_100281580));

  if (v5)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    CGAffineTransform v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_textForControlStates, "allKeys", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_textForControlStates,  "setObject:forKeyedSubscript:",  v4,  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10));
          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_textForControlStates,  "setObject:forKeyedSubscript:",  v4,  &off_100281580);
  }

  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setBorderColor:(id)a3 forControlState:(unint64_t)a4
{
  borderColorsForControlStates = self->_borderColorsForControlStates;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( borderColorsForControlStates,  "setObject:forKeyedSubscript:",  v7,  v8);

  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  -[UIImageView setHidden:](self->_imageView, "setHidden:", a3 == 0LL);
}

- (void)setBorderThickness:(double)a3
{
  if (a3 == 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = 13.0;
  }
  if (a3 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 18.0;
  }
  -[UIStackView setLayoutMargins:](self->_stackView, "setLayoutMargins:", 0.0, v5, 0.0, v5);
  -[TVMusicFloatingButton setCornerRadius:](self, "setCornerRadius:", v6);
}

- (double)borderThickness
{
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicAudioButton;
  -[TVMusicAudioButton layoutSubviews](&v3, "layoutSubviews");
  -[_TVMRoundRectView setNeedsDisplay](self->_roundRectView, "setNeedsDisplay");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicAudioButton;
  -[TVMusicFloatingButton didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

- (void)setButtonType:(int64_t)a3
{
  if (self->_buttonType != a3)
  {
    self->_buttonType = a3;
    if ((unint64_t)(a3 - 3) < 2)
    {
      __int128 v11 = @"DolbyAudioBadge";
      if (a3 == 3) {
        __int128 v11 = @"DolbyAtmosBadge";
      }
      id v7 = v11;
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
      -[TVMusicAudioButton _configureWithText:imageName:contentColor:]( self,  "_configureWithText:imageName:contentColor:",  0LL,  v7,  v6);
      uint64_t v9 = 0LL;
      double v10 = 0.0;
    }

    else
    {
      if ((unint64_t)(a3 - 1) > 1)
      {
LABEL_11:
        -[TVMusicAudioButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
        -[TVMusicAudioButton setNeedsLayout](self, "setNeedsLayout");
        return;
      }

      id v4 = @"AudioQualityHiResLossless";
      if (a3 == 1) {
        id v4 = @"AudioQualityLossless";
      }
      objc_super v5 = v4;
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v5 value:&stru_100279068 table:0]);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
      -[TVMusicAudioButton _configureWithText:imageName:contentColor:]( self,  "_configureWithText:imageName:contentColor:",  v7,  @"lossless",  v8);

      uint64_t v9 = 1LL;
      double v10 = 2.0;
    }

    -[TVMusicAudioButton setBorderThickness:](self, "setBorderThickness:", v10);
    -[TVMusicAudioButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v9);
    goto LABEL_11;
  }

- (void)_updateContentForCurrentState
{
  unint64_t v3 = (unint64_t)-[TVMusicAudioButton state](self, "state");
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v5 = v3 & 8;
  textForControlStates = self->_textForControlStates;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v3 & 0xFFFFFFFFFFFFFFFELL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](textForControlStates, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    p_label = &self->_label;
    -[UILabel setText:](self->_label, "setText:", v8);
  }

  else
  {
    double v10 = self->_textForControlStates;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11));
    p_label = &self->_label;
    -[UILabel setText:](self->_label, "setText:", v12);
  }

  textColorsForControlStates = self->_textColorsForControlStates;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( textColorsForControlStates,  "objectForKeyedSubscript:",  v14));
  if (v15)
  {
    -[UILabel setTextColor:](*p_label, "setTextColor:", v15);
  }

  else
  {
    v16 = self->_textColorsForControlStates;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));
    -[UILabel setTextColor:](*p_label, "setTextColor:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](*p_label, "text"));
  v20 = *p_label;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](v20, "text"));
    -[UILabel setHidden:](*p_label, "setHidden:", [v21 length] == 0);
  }

  else
  {
    -[UILabel setHidden:](v20, "setHidden:", 1LL);
  }

  imagesForControlStates = self->_imagesForControlStates;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  double v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( imagesForControlStates,  "objectForKeyedSubscript:",  v23));
  if (v24)
  {
    p_imageView = &self->_imageView;
    -[UIImageView setImage:](self->_imageView, "setImage:", v24);
  }

  else
  {
    v26 = self->_imagesForControlStates;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v27));
    p_imageView = &self->_imageView;
    -[UIImageView setImage:](self->_imageView, "setImage:", v28);
  }

  imageColorsForControlStates = self->_imageColorsForControlStates;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( imageColorsForControlStates,  "objectForKeyedSubscript:",  v30));
  if (v31)
  {
    -[UIImageView setTintColor:](*p_imageView, "setTintColor:", v31);
  }

  else
  {
    v32 = self->_imageColorsForControlStates;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", v33));
    -[UIImageView setTintColor:](*p_imageView, "setTintColor:", v34);
  }

  -[UIImageView sizeToFit](*p_imageView, "sizeToFit");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](*p_imageView, "image"));
  -[UIImageView setHidden:](*p_imageView, "setHidden:", v35 == 0LL);

  borderColorsForControlStates = self->_borderColorsForControlStates;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v4));
  v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( borderColorsForControlStates,  "objectForKeyedSubscript:",  v37));
  if (v38)
  {
    -[_TVMRoundRectView setColor:](self->_roundRectView, "setColor:", v38);
  }

  else
  {
    v39 = self->_borderColorsForControlStates;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v40));
    -[_TVMRoundRectView setColor:](self->_roundRectView, "setColor:", v41);
  }

  if (v5) {
    uint64_t v42 = 0LL;
  }
  else {
    uint64_t v42 = kCAFilterPlusL;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioButton layer](self, "layer"));
  [v43 setCompositingFilter:v42];

  -[TVMusicAudioButton setNeedsLayout](self, "setNeedsLayout");
  -[UIStackView frame](self->_stackView, "frame");
  double width = self->_stackViewSize.width;
  if (width != v46 || (double width = self->_stackViewSize.height, width != v44))
  {
    -[TVMusicAudioButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", width);
    -[UIStackView frame](self->_stackView, "frame");
    self->_stackViewSize.double width = v47;
    self->_stackViewSize.height = v48;
  }

- (void)_configureWithText:(id)a3 imageName:(id)a4 contentColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[TVMusicAudioButton setText:withColor:forControlState:](self, "setText:withColor:forControlState:", v10, v8, 0LL);
  -[TVMusicAudioButton setText:withColor:forControlState:](self, "setText:withColor:forControlState:", v10, v19, 8LL);

  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_imageNamed:withHeight:", v9, 23.0);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  -[TVMusicAudioButton setImage:withTintColor:forControlState:]( self,  "setImage:withTintColor:forControlState:",  v14,  v8,  0LL);
  -[TVMusicAudioButton setImage:withTintColor:forControlState:]( self,  "setImage:withTintColor:forControlState:",  v14,  v19,  8LL);
  -[TVMusicAudioButton setImage:withTintColor:forControlState:]( self,  "setImage:withTintColor:forControlState:",  0LL,  0LL,  4LL);
  -[TVMusicAudioButton setImage:withTintColor:forControlState:]( self,  "setImage:withTintColor:forControlState:",  0LL,  0LL,  12LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.2));
  -[TVMusicAudioButton setBorderColor:forControlState:](self, "setBorderColor:forControlState:", v15, 0LL);

  -[TVMusicAudioButton setBorderColor:forControlState:](self, "setBorderColor:forControlState:", v11, 8LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton floatingView](self, "floatingView"));
  [v16 setBackgroundColor:0 forState:0];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton floatingView](self, "floatingView"));
  [v17 setBackgroundColor:0 forState:4];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton floatingView](self, "floatingView"));
  [v18 setBackgroundColor:v11 forState:8];

  if (v10) {
    -[TVMusicAudioButton setTextYOffset:](self, "setTextYOffset:", -1.0);
  }
  -[TVMusicAudioButton _updateContentForCurrentState](self, "_updateContentForCurrentState");
}

+ (id)_imageNamed:(id)a3 withHeight:(double)a4
{
  if (a3)
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:"));
    [v5 size];
    if (v6 != a4)
    {
      [v5 size];
      if (v7 > 0.0)
      {
        [v5 size];
        double v9 = v8 * a4;
        [v5 size];
        uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvm_imageWithSize:", v9 / v10, a4));

        unint64_t v5 = (void *)v11;
      }
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithRenderingMode:2]);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

+ (id)losslessButton
{
  double v2 = objc_alloc_init(&OBJC_CLASS___TVMusicAudioButton);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton buttonWithTransparentBackground](v2, "buttonWithTransparentBackground"));

  [v3 setButtonType:1];
  return v3;
}

+ (id)hiResLosslessButton
{
  double v2 = objc_alloc_init(&OBJC_CLASS___TVMusicAudioButton);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton buttonWithTransparentBackground](v2, "buttonWithTransparentBackground"));

  [v3 setButtonType:2];
  return v3;
}

+ (id)spatialButton
{
  double v2 = objc_alloc_init(&OBJC_CLASS___TVMusicAudioButton);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicFloatingButton buttonWithTransparentBackground](v2, "buttonWithTransparentBackground"));

  [v3 setButtonType:3];
  return v3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)label
{
  return self->_label;
}

- (double)textYOffset
{
  return self->_textYOffset;
}

- (void).cxx_destruct
{
}

@end