@interface MTTVArtworkBaseCollectionViewCell
+ (CGSize)artworkSize;
+ (CGSize)itemSize;
+ (id)reuseIdentifier;
+ (id)subtitleFont;
+ (id)titleFont;
- (BOOL)isShowingDefaultImage;
- (MTTVArtworkBaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTTVBadgeView)badgeView;
- (NSString)imageKey;
- (NSString)subtitle;
- (NSString)title;
- (TVMTAnimatedLabel)titleLabel;
- (UIImageView)artworkView;
- (UILabel)subtitleLabel;
- (unint64_t)badgeCount;
- (void)_setArtwork:(id)a3;
- (void)_updateSubtitleLabelVisibility;
- (void)_updateTitleLabelVisibility;
- (void)configureSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)loadImageForKey:(id)a3;
- (void)prepareForReuse;
- (void)setArtworkView:(id)a3;
- (void)setBadgeCount:(unint64_t)a3;
- (void)setBadgeView:(id)a3;
- (void)setImageKey:(id)a3;
- (void)setShowingDefaultImage:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MTTVArtworkBaseCollectionViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (CGSize)artworkSize
{
  double v2 = 273.0;
  double v3 = 273.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)itemSize
{
  double v4 = v3;
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 titleFont]);
  [v7 lineHeight];
  double v9 = v6 + v8;
  objc_msgSend(v7, "mt_offsetFromFirstBaselineToTop");
  double v11 = v9 + 34.0 - v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue([a1 subtitleFont]);
  [v12 lineHeight];
  double v14 = v11 + v13;
  objc_msgSend(v12, "mt_offsetFromFirstBaselineToTop");
  double v16 = 36.0 - v15;
  objc_msgSend(v7, "mt_offsetFromLastBaselineToBottom");
  double v18 = v14 + v16 - v17;
  if (qword_1002B6C38[0] != -1) {
    dispatch_once(qword_1002B6C38, &stru_1002457A0);
  }
  double v19 = ceil(v18 * *(double *)&qword_1002B47E8) / *(double *)&qword_1002B47E8;
  double v20 = ceil(v18);
  else {
    double v21 = v19;
  }

  double v22 = v4;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (id)titleFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCallout);
}

+ (id)subtitleFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCallout);
}

- (MTTVArtworkBaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVArtworkBaseCollectionViewCell;
  double v3 = -[MTTVArtworkBaseCollectionViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  double v4 = v3;
  if (v3) {
    -[MTTVArtworkBaseCollectionViewCell configureSubviews](v3, "configureSubviews");
  }
  return v4;
}

- (void)configureSubviews
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[MTTVArtworkBaseCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell artworkView](self, "artworkView"));
  [v4 addSubview:v5];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  [v6 addSubview:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  [v8 addSubview:v9];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  [v10 addSubview:v11];

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell artworkView](self, "artworkView"));
  -[MTTVArtworkBaseCollectionViewCell im_updateLayersForLabel:imageView:]( self,  "im_updateLayersForLabel:imageView:",  v13,  v12);
}

- (TVMTAnimatedLabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___TVMTAnimatedLabel);
    double v5 = self->_titleLabel;
    self->_titleLabel = v4;

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMTAnimatedLabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVMTAnimatedLabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

    -[TVMTAnimatedLabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
    id v8 = [(id)objc_opt_class(self) titleFont];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TVMTLabel setFont:](self->_titleLabel, "setFont:", v9);

    -[TVMTLabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1LL);
    -[MTTVArtworkBaseCollectionViewCell _updateTitleLabelVisibility](self, "_updateTitleLabelVisibility");
    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    double v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v7);

    -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1LL);
    id v8 = [(id)objc_opt_class(self) subtitleFont];
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v9);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1LL);
    -[MTTVArtworkBaseCollectionViewCell _updateSubtitleLabelVisibility](self, "_updateSubtitleLabelVisibility");
    subtitleLabel = self->_subtitleLabel;
  }

  return subtitleLabel;
}

- (UIImageView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    double v4 = objc_alloc(&OBJC_CLASS___UIImageView);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
    [v5 bounds];
    objc_super v6 = -[UIImageView initWithFrame:](v4, "initWithFrame:");
    v7 = self->_artworkView;
    self->_artworkView = v6;

    -[UIImageView setAdjustsImageWhenAncestorFocused:](self->_artworkView, "setAdjustsImageWhenAncestorFocused:", 1LL);
    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (MTTVBadgeView)badgeView
{
  badgeView = self->_badgeView;
  if (!badgeView)
  {
    double v4 = objc_alloc_init(&OBJC_CLASS___MTTVBadgeView);
    double v5 = self->_badgeView;
    self->_badgeView = v4;

    -[MTTVBadgeView setHidden:](self->_badgeView, "setHidden:", 1LL);
    badgeView = self->_badgeView;
  }

  return badgeView;
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___MTTVArtworkBaseCollectionViewCell;
  -[MTTVArtworkBaseCollectionViewCell layoutSubviews](&v63, "layoutSubviews");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;

  double y = CGRectZero.origin.y;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell artworkView](self, "artworkView"));
  objc_msgSend(v7, "setFrame:", CGRectZero.origin.x, y, v5, v5);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell artworkView](self, "artworkView"));
  objc_msgSend(v8, "im_focusedFrame");
  double x = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;

  unsigned int v17 = -[MTTVArtworkBaseCollectionViewCell isFocused](self, "isFocused");
  if (v17) {
    CGFloat v18 = v14;
  }
  else {
    CGFloat v18 = v5;
  }
  if (v17) {
    double v19 = v16;
  }
  else {
    double v19 = v5;
  }
  CGFloat rect = v19;
  if (!v17) {
    double x = CGRectZero.origin.x;
  }
  CGFloat v61 = x;
  if (!v17) {
    CGFloat v12 = y;
  }
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel", *(void *)&v14));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v20 font]);

  CGFloat v22 = v14 + 20.0 + 20.0;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v23, "sizeThatFits:", v5, 1.79769313e308);
  double v25 = v24;

  double v26 = IMRoundToPixel((v5 - v22) * 0.5);
  v64.origin.double x = x;
  v64.origin.double y = v12;
  v64.size.width = v18;
  v64.size.height = rect;
  CGFloat v27 = CGRectGetMaxY(v64) + 34.0;
  objc_msgSend(v21, "mt_offsetFromFirstBaselineToTop");
  CGFloat v29 = v27 - v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v30, "setFrame:", v26, v29, v22, v25);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 font]);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v33, "sizeThatFits:", v5, 1.79769313e308);
  double v35 = v34;

  double v36 = IMRoundToPixel((v5 - v59) * 0.5);
  v65.origin.double x = v26;
  v65.origin.double y = v29;
  v65.size.width = v22;
  v65.size.height = v25;
  double MaxY = CGRectGetMaxY(v65);
  objc_msgSend(v21, "mt_offsetFromLastBaselineToBottom");
  double v39 = MaxY - v38 + 36.0;
  objc_msgSend(v32, "mt_offsetFromFirstBaselineToTop");
  double v41 = v39 - v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v42, "setFrame:", v36, v41, v59, v35);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  [v43 frame];
  CGFloat v45 = v44;
  CGFloat v60 = v46;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell contentView](self, "contentView"));
  [v48 bounds];
  objc_msgSend(v47, "sizeThatFits:", v49, v50);
  double v52 = v51;
  double v54 = v53;

  v66.origin.double x = v61;
  v66.origin.double y = v12;
  v66.size.width = v18;
  v66.size.height = rect;
  double MaxX = CGRectGetMaxX(v66);
  v67.origin.double x = v45;
  v67.origin.double y = v60;
  v67.size.width = v52;
  v67.size.height = v54;
  double v56 = MaxX - CGRectGetWidth(v67) + 8.0;
  v68.origin.double x = v61;
  v68.origin.double y = v12;
  v68.size.width = v18;
  v68.size.height = rect;
  CGFloat v57 = CGRectGetMinY(v68) + -8.0;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  objc_msgSend(v58, "setFrame:", v56, v57, v52, v54);
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVArtworkBaseCollectionViewCell;
  -[MTTVArtworkBaseCollectionViewCell prepareForReuse](&v7, "prepareForReuse");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  [v3 setText:0];

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  [v4 setText:0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell artworkView](self, "artworkView"));
  [v5 setImage:0];

  -[MTTVArtworkBaseCollectionViewCell setImageKey:](self, "setImageKey:", 0LL);
  -[MTTVArtworkBaseCollectionViewCell setShowingDefaultImage:](self, "setShowingDefaultImage:", 1LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  [v6 setHidden:1];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVArtworkBaseCollectionViewCell;
  id v6 = a4;
  -[MTTVArtworkBaseCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100123AF8;
  v7[3] = &unk_10023FF98;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  [v6 setText:v5];

  -[MTTVArtworkBaseCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  [v6 setText:v5];

  -[MTTVArtworkBaseCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBadgeCount:(unint64_t)a3
{
  BOOL v5 = a3 == 0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  [v6 setHidden:v5];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell badgeView](self, "badgeView"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  uint64_t v9 = IMAccessibilityLocalizedNumber(v8);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setBadgeValue:v10];

  -[MTTVArtworkBaseCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)loadImageForKey:(id)a3
{
  id v4 = a3;
  -[MTTVArtworkBaseCollectionViewCell setImageKey:](self, "setImageKey:", v4);
  objc_initWeak(&location, self);
  [(id)objc_opt_class(self) artworkSize];
  id v6 = v5;
  objc_super v8 = v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell imageKey](self, "imageKey"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100123E24;
  v11[3] = &unk_100245780;
  objc_copyWeak(v12, &location);
  v12[1] = v6;
  v12[2] = v8;
  objc_msgSend(v9, "asyncImageForKey:size:completionHandler:", v10, v11, *(double *)&v6, *(double *)&v8);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_updateTitleLabelVisibility
{
  id v3 = -[MTTVArtworkBaseCollectionViewCell isFocused](self, "isFocused");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  [v4 setHidden:v3 ^ 1];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell titleLabel](self, "titleLabel"));
  [v5 setAnimating:v3];
}

- (void)_updateSubtitleLabelVisibility
{
  uint64_t v3 = -[MTTVArtworkBaseCollectionViewCell isFocused](self, "isFocused") ^ 1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVArtworkBaseCollectionViewCell subtitleLabel](self, "subtitleLabel"));
  [v4 setHidden:v3];
}

- (void)_setArtwork:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unint64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void)setBadgeView:(id)a3
{
}

- (NSString)imageKey
{
  return self->_imageKey;
}

- (void)setImageKey:(id)a3
{
}

- (BOOL)isShowingDefaultImage
{
  return self->_showingDefaultImage;
}

- (void)setShowingDefaultImage:(BOOL)a3
{
  self->_showingDefaultImage = a3;
}

- (void).cxx_destruct
{
}

@end