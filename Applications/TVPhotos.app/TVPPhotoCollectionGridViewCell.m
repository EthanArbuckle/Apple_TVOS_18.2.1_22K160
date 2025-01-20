@interface TVPPhotoCollectionGridViewCell
- (BOOL)shouldTitleAnimate;
- (BOOL)shouldTitleExpand;
- (CGSize)imageSize;
- (NSLayoutConstraint)badgeImageLeftConstraint;
- (NSLayoutConstraint)titleLeftConstraint;
- (NSLayoutConstraint)titleRightConstraint;
- (NSLayoutConstraint)titleTopConstraint;
- (NSString)title;
- (TVPPhotoCollectionGridViewCell)initWithFrame:(CGRect)a3;
- (UIImage)badgeImage;
- (UIImageView)badgeImageView;
- (UILabel)titleLabel;
- (double)_focusedGrowthMagnitude;
- (double)cellCornerRadius;
- (double)focusedMargin;
- (double)unfocusedMargin;
- (void)_updateLayoutProperties;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeImageLeftConstraint:(id)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setFocusedMargin:(double)a3;
- (void)setShouldTitleAnimate:(BOOL)a3;
- (void)setShouldTitleExpand:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLeftConstraint:(id)a3;
- (void)setTitleRightConstraint:(id)a3;
- (void)setTitleTopConstraint:(id)a3;
- (void)setUnfocusedMargin:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPPhotoCollectionGridViewCell

- (TVPPhotoCollectionGridViewCell)initWithFrame:(CGRect)a3
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVPPhotoCollectionGridViewCell;
  v3 = -[TVPPhotoCell initWithFrame:](&v46, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v3->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionGridViewCell contentView](v3, "contentView"));
    [v8 addSubview:v3->_titleLabel];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](v3, "imageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 leadingAnchor]);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11]);

    -[NSLayoutConstraint setActive:](v12, "setActive:", 1LL);
    titleLeftConstraint = v3->_titleLeftConstraint;
    v3->_titleLeftConstraint = v12;
    v14 = v12;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](v3, "imageView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bottomAnchor]);
    v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v17 constant:3.0]);

    -[NSLayoutConstraint setActive:](v18, "setActive:", 1LL);
    titleTopConstraint = v3->_titleTopConstraint;
    v3->_titleTopConstraint = v18;
    v20 = v18;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](v3, "imageView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 trailingAnchor]);
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);

    -[NSLayoutConstraint setActive:](v24, "setActive:", 1LL);
    titleRightConstraint = v3->_titleRightConstraint;
    v3->_titleRightConstraint = v24;
    v26 = v24;

    v27 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    badgeImageView = v3->_badgeImageView;
    v3->_badgeImageView = v27;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_badgeImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setClipsToBounds:](v3->_badgeImageView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v3->_badgeImageView, "setContentMode:", 4LL);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionGridViewCell contentView](v3, "contentView"));
    [v29 addSubview:v3->_badgeImageView];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v3->_badgeImageView, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](v3, "imageView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v31 leadingAnchor]);
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v32]);

    badgeImageLeftConstraint = v3->_badgeImageLeftConstraint;
    v3->_badgeImageLeftConstraint = v33;
    v35 = v33;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_badgeImageView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));

    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37]);
    [v38 setActive:1];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_badgeImageView, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40 constant:-5.0]);

    [v41 setActive:1];
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v3->_badgeImageView, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);

    [v44 setActive:1];
  }

  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPPhotoCollectionGridViewCell;
  -[TVPPhotoCell prepareForReuse](&v3, "prepareForReuse");
  -[TVPPhotoCollectionGridViewCell setTitle:](self, "setTitle:", 0LL);
}

- (double)cellCornerRadius
{
  return 12.0;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setBadgeImage:(id)a3
{
  if (a3) {
    v5 = &OBJC_IVAR___TVPPhotoCollectionGridViewCell__titleLeftConstraint;
  }
  else {
    v5 = &OBJC_IVAR___TVPPhotoCollectionGridViewCell__badgeImageLeftConstraint;
  }
  if (a3) {
    v6 = &OBJC_IVAR___TVPPhotoCollectionGridViewCell__badgeImageLeftConstraint;
  }
  else {
    v6 = &OBJC_IVAR___TVPPhotoCollectionGridViewCell__titleLeftConstraint;
  }
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v5) setActive:0];
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + *v6) setActive:1];
  -[TVPPhotoCollectionGridViewCell _updateLayoutProperties](self, "_updateLayoutProperties");
}

- (UIImage)badgeImage
{
  return -[UIImageView image](self->_badgeImageView, "image");
}

- (CGSize)imageSize
{
  double v2 = 308.0;
  double v3 = 308.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionGridViewCell traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[TVPThemeManager listTitleTextColor](&OBJC_CLASS___TVPThemeManager, "listTitleTextColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionGridViewCell titleLabel](self, "titleLabel"));
    [v8 setTextColor:v9];
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVPPhotoCollectionGridViewCell;
  -[TVPPhotoCell didUpdateFocusInContext:withAnimationCoordinator:]( &v30,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  v8 = (TVPPhotoCollectionGridViewCell *)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);

  if (v8 == self)
  {
    -[TVPPhotoCollectionGridViewCell layoutIfNeeded](self, "layoutIfNeeded");
    -[TVPPhotoCollectionGridViewCell _focusedGrowthMagnitude](self, "_focusedGrowthMagnitude");
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    v26 = sub_10000AB38;
    v27 = &unk_1000C9AC8;
    v28 = self;
    uint64_t v29 = v13;
    v10 = &v24;
    v12 = v7;
    v11 = 0LL;
    goto LABEL_5;
  }

  id v9 = (TVPPhotoCollectionGridViewCell *)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);

  if (v9 == self)
  {
    -[TVPPhotoCollectionGridViewCell layoutIfNeeded](self, "layoutIfNeeded");
    -[UILabel setContentMode:](self->_titleLabel, "setContentMode:", 4LL);
    v18 = self;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10000ABD0;
    v22 = &unk_1000C9528;
    v23 = self;
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472LL;
    v16 = sub_10000AC60;
    v17 = &unk_1000C9528;
    v10 = &v19;
    v11 = &v14;
    v12 = v7;
LABEL_5:
    objc_msgSend( v12,  "addCoordinatedAnimations:completion:",  v10,  v11,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29);
  }
}

- (double)_focusedGrowthMagnitude
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedFrameGuide]);
  [v3 layoutFrame];
  double v5 = fabs(v4);

  return v5;
}

- (void)_updateLayoutProperties
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  NSAttributedStringKey v21 = NSFontAttributeName;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v22 = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  [v3 sizeWithAttributes:v5];
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_badgeImageView, "image"));
  [v8 size];
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionGridViewCell badgeImage](self, "badgeImage"));
  double v12 = v7 + 5.0 + v10;
  if (!v11) {
    double v12 = v7;
  }
  double v13 = v12 + 2.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  [v14 bounds];
  double Width = CGRectGetWidth(v23);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 focusedFrameGuide]);
  [v17 layoutFrame];
  double v18 = CGRectGetWidth(v24);

  self->_shouldTitleExpand = v13 > Width;
  self->_shouldTitleAnimate = v13 > v18;
  if (v13 <= v18)
  {
    if (self->_shouldTitleExpand)
    {
      self->_unfocusedMargin = 0.0;
      double v19 = floor((v13 - Width) * 0.5);
    }

    else
    {
      double v19 = floor((v13 - Width) * 0.5);
      self->_unfocusedMargin = v19;
    }
  }

  else
  {
    self->_unfocusedMargin = 0.0;
    double v19 = floor((v18 - Width) * 0.5);
  }

  self->_focusedMargin = v19;
  else {
    int v20 = 11;
  }
  -[NSLayoutConstraint setConstant:]( self->_badgeImageLeftConstraint,  "setConstant:",  -*(double *)&(&self->super.super.super.super.super.super.isa)[v20]);
  -[NSLayoutConstraint setConstant:]( self->_titleLeftConstraint,  "setConstant:",  -*(double *)&(&self->super.super.super.super.super.super.isa)[v20]);
  -[NSLayoutConstraint setConstant:]( self->_titleRightConstraint,  "setConstant:",  *(double *)&(&self->super.super.super.super.super.super.isa)[v20]);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (BOOL)shouldTitleExpand
{
  return self->_shouldTitleExpand;
}

- (void)setShouldTitleExpand:(BOOL)a3
{
  self->_shouldTitleExpand = a3;
}

- (BOOL)shouldTitleAnimate
{
  return self->_shouldTitleAnimate;
}

- (void)setShouldTitleAnimate:(BOOL)a3
{
  self->_shouldTitleAnimate = a3;
}

- (double)unfocusedMargin
{
  return self->_unfocusedMargin;
}

- (void)setUnfocusedMargin:(double)a3
{
  self->_unfocusedMargin = a3;
}

- (double)focusedMargin
{
  return self->_focusedMargin;
}

- (void)setFocusedMargin:(double)a3
{
  self->_focusedMargin = a3;
}

- (NSLayoutConstraint)titleLeftConstraint
{
  return self->_titleLeftConstraint;
}

- (void)setTitleLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleTopConstraint
{
  return self->_titleTopConstraint;
}

- (void)setTitleTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleRightConstraint
{
  return self->_titleRightConstraint;
}

- (void)setTitleRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)badgeImageLeftConstraint
{
  return self->_badgeImageLeftConstraint;
}

- (void)setBadgeImageLeftConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end