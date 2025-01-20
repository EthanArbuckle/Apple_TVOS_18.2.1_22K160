@interface TVHPlaylistItemListViewCell
+ (id)_subtitleLabelTextColorWithFocus:(BOOL)a3;
+ (id)_titleLabelTextColorWithFocus:(BOOL)a3;
- (BOOL)hasExplicitLyrics;
- (BOOL)isHighDefinition;
- (NSNumber)durationInSeconds;
- (NSString)contentRatingBadgeText;
- (NSString)subtitle;
- (NSString)title;
- (TVHContentRatingView)contentRatingView;
- (TVHMediaImageView)thumbnailImageView;
- (TVHNowPlayingBarsView)nowPlayingBarsView;
- (TVHPlaceholder)placeholder;
- (TVHPlaylistItemListViewCell)initWithFrame:(CGRect)a3;
- (TVImageProxy)imageProxy;
- (UIImage)contentRatingBadgeImage;
- (UILabel)durationLabel;
- (UILabel)highDefinitionLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)_floatingContentViewHeight;
- (double)imageWidth;
- (id)_floatingContentViewContentView;
- (id)_highDefinitionBadgeAttributedString;
- (unint64_t)nowPlayingBarsState;
- (void)_updateColors;
- (void)_updateContentRatingView;
- (void)_updateNowPlayingBars:(unint64_t)a3;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4;
- (void)setDurationInSeconds:(id)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageWidth:(double)a3;
- (void)setNowPlayingBarsState:(unint64_t)a3;
- (void)setNowPlayingBarsView:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVHPlaylistItemListViewCell

- (TVHPlaylistItemListViewCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell _floatingContentViewContentView](v3, "_floatingContentViewContentView"));
    v6 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
    thumbnailImageView = v4->_thumbnailImageView;
    v4->_thumbnailImageView = v6;

    -[TVHMediaImageView setCornerRadius:](v4->_thumbnailImageView, "setCornerRadius:", 12.0);
    -[TVHMediaImageView setContentMode:](v4->_thumbnailImageView, "setContentMode:", 2LL);
    [v5 addSubview:v4->_thumbnailImageView];
    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 4LL);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 1LL);
    v10 = v4->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 11LL));
    -[UILabel setFont:](v10, "setFont:", v11);

    [v5 addSubview:v4->_titleLabel];
    v12 = objc_alloc_init(&OBJC_CLASS___TVHContentRatingView);
    contentRatingView = v4->_contentRatingView;
    v4->_contentRatingView = v12;

    [v5 addSubview:v4->_contentRatingView];
    v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
    highDefinitionLabel = v4->_highDefinitionLabel;
    v4->_highDefinitionLabel = v14;

    -[UILabel setHidden:](v4->_highDefinitionLabel, "setHidden:", 1LL);
    [v5 addSubview:v4->_highDefinitionLabel];
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v16;

    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 4LL);
    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 1LL);
    v18 = v4->_subtitleLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v18, "setFont:", v19);

    [v5 addSubview:v4->_subtitleLabel];
    v20 = objc_alloc_init(&OBJC_CLASS___UILabel);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = v20;

    -[UILabel setLineBreakMode:](v4->_durationLabel, "setLineBreakMode:", 4LL);
    v22 = v4->_durationLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 12LL));
    -[UILabel setFont:](v22, "setFont:", v23);

    -[UILabel setNumberOfLines:](v4->_durationLabel, "setNumberOfLines:", 1LL);
    [v5 addSubview:v4->_durationLabel];
  }

  return v4;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell thumbnailImageView](self, "thumbnailImageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell thumbnailImageView](self, "thumbnailImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell thumbnailImageView](self, "thumbnailImageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell thumbnailImageView](self, "thumbnailImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:") || self->_hasExplicitLyrics != v4)
  {
    v6 = (NSString *)[v9 copy];
    title = self->_title;
    self->_title = v6;

    self->_hasExplicitLyrics = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "tvh_setText:isExplicit:", self->_title, self->_hasExplicitLyrics);
  }
}

- (void)setSubtitle:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell subtitle](self, "subtitle"));
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell subtitleLabel](self, "subtitleLabel"));
    [v6 setText:v7];
  }
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (UIImage)contentRatingBadgeImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeImage]);

  return (UIImage *)v3;
}

- (NSString)contentRatingBadgeText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeText]);

  return (NSString *)v3;
}

- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  [v8 setContentRatingBadgeImage:v7 badgeText:v6];

  -[TVHPlaylistItemListViewCell _updateContentRatingView](self, "_updateContentRatingView");
}

- (void)setDurationInSeconds:(id)a3
{
  id v7 = a3;
  if ((-[NSNumber isEqual:](self->_durationInSeconds, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_durationInSeconds, a3);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tvh_positionalDurationStringForSeconds:]( &OBJC_CLASS___NSString,  "tvh_positionalDurationStringForSeconds:",  v7));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell durationLabel](self, "durationLabel"));
    [v6 setText:v5];
  }
}

- (void)setHighDefinition:(BOOL)a3
{
  if (self->_highDefinition != a3)
  {
    BOOL v3 = a3;
    self->_highDefinition = a3;
    if (a3) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( -[TVHPlaylistItemListViewCell _highDefinitionBadgeAttributedString]( self,  "_highDefinitionBadgeAttributedString"));
    }
    else {
      uint64_t v5 = 0LL;
    }
    id v6 = (id)v5;
    -[UILabel setAttributedText:](self->_highDefinitionLabel, "setAttributedText:", v5);
    -[UILabel setHidden:](self->_highDefinitionLabel, "setHidden:", !v3);
    -[TVHPlaylistItemListViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)_updateContentRatingView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  objc_msgSend(v3, "setHidden:", objc_msgSend(v3, "hasDisplayableContentRating") ^ 1);
  [v3 sizeToFit];
  -[TVHPlaylistItemListViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNowPlayingBarsState:(unint64_t)a3
{
  if (self->_nowPlayingBarsState != a3)
  {
    self->_nowPlayingBarsState = a3;
    -[TVHPlaylistItemListViewCell _updateNowPlayingBars:](self, "_updateNowPlayingBars:");
  }

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  -[TVHPlaylistItemListViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[TVHPlaylistItemListViewCell _updateColors](self, "_updateColors");
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  -[TVHListViewCell layoutSubviews](&v50, "layoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell _floatingContentViewContentView](self, "_floatingContentViewContentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  id v9 = v8;
  if (v8)
  {
    UIRectCenteredYInRect([v8 frame]);
    objc_msgSend(v9, "setFrame:");
  }

  id v10 = -[TVHPlaylistItemListViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell thumbnailImageView](self, "thumbnailImageView"));
  [v3 frame];
  double v13 = v12;
  -[TVHPlaylistItemListViewCell imageWidth](self, "imageWidth");
  CGFloat v15 = v14;
  double v16 = v5 - v14;
  if (v10) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  [v11 setFrame:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell durationLabel](self, "durationLabel"));
  double height = CGSizeZero.height;
  objc_msgSend(v18, "sizeThatFits:");
  if (v19 >= 92.0) {
    double v20 = v19;
  }
  else {
    double v20 = 92.0;
  }
  double v21 = v5 - v20 + -20.0;
  if (v10) {
    double v21 = 20.0;
  }
  double v22 = floor((v7 + -45.0) * 0.5);
  if (v10) {
    CGFloat v23 = v21;
  }
  else {
    CGFloat v23 = v17;
  }
  double v24 = 0.0;
  if (v10) {
    double v25 = v22;
  }
  else {
    double v25 = 0.0;
  }
  if (v10) {
    double v26 = 45.0;
  }
  else {
    double v26 = v13;
  }
  if (v10) {
    CGFloat v27 = v20;
  }
  else {
    CGFloat v27 = v15;
  }
  if (!v10)
  {
    double v17 = v21;
    double v24 = v22;
  }

  CGFloat rect = v24;
  if (!v10)
  {
    double v13 = 45.0;
    CGFloat v15 = v20;
  }

  objc_msgSend(v18, "setFrame:");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell titleLabel](self, "titleLabel"));
  v51.origin.x = v23;
  v51.origin.y = v25;
  v51.size.width = v27;
  v51.size.double height = v26;
  double MaxX = CGRectGetMaxX(v51);
  v52.origin.x = v17;
  v52.origin.y = rect;
  v52.size.width = v15;
  v52.size.double height = v13;
  double v30 = MaxX + 20.0;
  double v31 = CGRectGetMinX(v52) - v30 + -16.0;
  objc_msgSend(v28, "setFrame:", v30, 0.0, v31, 45.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell subtitleLabel](self, "subtitleLabel"));
  v53.origin.y = 0.0;
  v53.origin.x = v30;
  v53.size.width = v31;
  v53.size.double height = 45.0;
  objc_msgSend(v32, "setFrame:", v30, CGRectGetMaxY(v53) + 0.0, v31, 45.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell highDefinitionLabel](self, "highDefinitionLabel"));
  if (![v33 isHidden] || (objc_msgSend(v34, "isHidden") & 1) == 0)
  {
    objc_msgSend(v34, "sizeThatFits:", CGSizeZero.width, height);
    double v36 = v35;
    if ([v33 isHidden])
    {
      double v37 = 10.0;
      uint64_t v38 = -1LL;
    }

    else
    {
      [v33 frame];
      uint64_t v38 = 0LL;
      double v37 = v39 + 10.0;
    }

    unsigned int v40 = [v34 isHidden];
    double v41 = -0.0;
    if (!v40) {
      double v41 = v36;
    }
    double v42 = v37 + v41 + (double)(v38 + (unint64_t)(v40 ^ 1)) * 5.0;
    v54.origin.y = 0.0;
    v54.origin.x = v30;
    v54.size.width = v31;
    v54.size.double height = 45.0;
    double v43 = CGRectGetMaxX(v54);
    objc_msgSend(v28, "sizeThatFits:", CGSizeZero.width, height);
    double v45 = v30 + v44;
    if (v45 >= v43) {
      double v46 = v43;
    }
    else {
      double v46 = v45;
    }
    if (v42 + v46 > v43) {
      objc_msgSend(v28, "setFrame:", v30, 0.0, v43 - v42 - v30, 45.0);
    }
    if (([v33 isHidden] & 1) == 0)
    {
      UIRectCenteredYInRect([v33 frame]);
      objc_msgSend(v33, "setFrame:");
    }

    id v47 = [v34 isHidden];
    if ((v47 & 1) == 0)
    {
      UIRectCenteredYInRect(v47);
      objc_msgSend(v34, "setFrame:");
    }
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  -[TVHListViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHPlaylistItemListViewCell setNowPlayingBarsState:](self, "setNowPlayingBarsState:", 0LL);
  -[TVHPlaylistItemListViewCell setImageProxy:](self, "setImageProxy:", 0LL);
  -[TVHPlaylistItemListViewCell setPlaceholder:](self, "setPlaceholder:", 0LL);
  -[TVHPlaylistItemListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", 0LL, 0LL);
  -[TVHPlaylistItemListViewCell setSubtitle:](self, "setSubtitle:", 0LL);
  -[TVHPlaylistItemListViewCell setContentRatingBadgeImage:badgeText:]( self,  "setContentRatingBadgeImage:badgeText:",  0LL,  0LL);
  -[TVHPlaylistItemListViewCell setDurationInSeconds:](self, "setDurationInSeconds:", 0LL);
  -[TVHPlaylistItemListViewCell setHighDefinition:](self, "setHighDefinition:", 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100016EB0;
  v8[3] = &unk_1000FD260;
  v8[4] = self;
  unsigned __int8 v9 = -[TVHPlaylistItemListViewCell isFocused](self, "isFocused");
  [v6 addCoordinatedAnimations:v8 completion:0];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHPlaylistItemListViewCell isFocused](self, "isFocused"));
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHPlaylistItemListViewCell;
  id v4 = a3;
  -[TVHPlaylistItemListViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 != v7) {
    -[TVHPlaylistItemListViewCell _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  id v3 = -[TVHPlaylistItemListViewCell isFocused](self, "isFocused");
  id v4 = [(id)objc_opt_class(self) _titleLabelTextColorWithFocus:v3];
  id v15 = (id)objc_claimAutoreleasedReturnValue(v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell titleLabel](self, "titleLabel"));
  [v5 setTextColor:v15];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentRatingView](self, "contentRatingView"));
  [v6 setTintColor:v15];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell highDefinitionLabel](self, "highDefinitionLabel"));
  if (([v7 isHidden] & 1) == 0)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPlaylistItemListViewCell _highDefinitionBadgeAttributedString]( self,  "_highDefinitionBadgeAttributedString"));
    [v7 setAttributedText:v8];
  }

  id v9 = [(id)objc_opt_class(self) _subtitleLabelTextColorWithFocus:v3];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell subtitleLabel](self, "subtitleLabel"));
  [v11 setTextColor:v10];

  id v12 = [(id)objc_opt_class(self) _durationLabelTextColorWithFocus:v3];
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell durationLabel](self, "durationLabel"));
  [v14 setTextColor:v13];
}

- (id)_highDefinitionBadgeAttributedString
{
  return +[NSAttributedString tvh_highDefinitionAttributedStringWithTextStyle:focus:]( &OBJC_CLASS___NSAttributedString,  "tvh_highDefinitionAttributedStringWithTextStyle:focus:",  UIFontTextStyleSubtitle3,  -[TVHPlaylistItemListViewCell isFocused](self, "isFocused"));
}

+ (id)_titleLabelTextColorWithFocus:(BOOL)a3
{
  if (a3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  else
  {
    if (qword_1001572A0 != -1) {
      dispatch_once(&qword_1001572A0, &stru_1000FD280);
    }
    id v3 = (id)qword_100157298;
  }

  return v3;
}

+ (id)_subtitleLabelTextColorWithFocus:(BOOL)a3
{
  if (a3)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  }

  else
  {
    if (qword_1001572B0 != -1) {
      dispatch_once(&qword_1001572B0, &stru_1000FD2A0);
    }
    id v3 = (id)qword_1001572A8;
  }

  return v3;
}

- (double)_floatingContentViewHeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell _floatingContentViewContentView](self, "_floatingContentViewContentView"));
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)_updateNowPlayingBars:(unint64_t)a3
{
  double v5 = (TVHNowPlayingBarsView *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (a3)
  {
    if (!v5)
    {
      if (-[TVHPlaylistItemListViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection"))
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentView](self, "contentView"));
        [v6 bounds];
        double v8 = v7 + 46.0;
      }

      else
      {
        double v8 = -46.0;
      }

      double v9 = sub_100065D94();
      double v16 = -[TVHNowPlayingBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsView),  "initWithFrame:",  v8,  0.0,  v9,  v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_60PercentWhiteColor"));
      double v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v11,  v12));
      -[TVHNowPlayingBarsView setTintColor:](v16, "setTintColor:", v13);

      double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaylistItemListViewCell contentView](self, "contentView"));
      [v14 addSubview:v16];

      -[TVHPlaylistItemListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", v16);
      -[TVHPlaylistItemListViewCell setNeedsLayout](self, "setNeedsLayout");
      double v5 = v16;
    }

    id v15 = v5;
    -[TVHNowPlayingBarsView setState:](v5, "setState:", a3);
  }

  else
  {
    id v15 = v5;
    -[TVHNowPlayingBarsView removeFromSuperview](v5, "removeFromSuperview");
    -[TVHPlaylistItemListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", 0LL);
    -[TVHPlaylistItemListViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_floatingContentViewContentView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentView]);

  return v3;
}

- (unint64_t)nowPlayingBarsState
{
  return self->_nowPlayingBarsState;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasExplicitLyrics
{
  return self->_hasExplicitLyrics;
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (BOOL)isHighDefinition
{
  return self->_highDefinition;
}

- (TVHMediaImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (TVHContentRatingView)contentRatingView
{
  return self->_contentRatingView;
}

- (UILabel)highDefinitionLabel
{
  return self->_highDefinitionLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (TVHNowPlayingBarsView)nowPlayingBarsView
{
  return self->_nowPlayingBarsView;
}

- (void)setNowPlayingBarsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end