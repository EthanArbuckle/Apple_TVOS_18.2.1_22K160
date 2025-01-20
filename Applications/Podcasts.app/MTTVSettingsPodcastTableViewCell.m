@interface MTTVSettingsPodcastTableViewCell
- (BOOL)dim;
- (BOOL)on;
- (CAShapeLayer)leftImageMaskLayer;
- (MTTVSettingsPodcastTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)leftImageView;
- (UIView)dimView;
- (double)offSetHeight;
- (void)configureSubviews;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setDim:(BOOL)a3;
- (void)setDimView:(id)a3;
- (void)setLeftImageMaskLayer:(id)a3;
- (void)setLeftImageView:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setOnOffLabel:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImageForPodcast:(id)a3;
- (void)updateWithPodcast:(id)a3;
@end

@implementation MTTVSettingsPodcastTableViewCell

- (MTTVSettingsPodcastTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVSettingsPodcastTableViewCell;
  v4 = -[MTTVSettingsPodcastTableViewCell initWithStyle:reuseIdentifier:]( &v7,  "initWithStyle:reuseIdentifier:",  1LL,  a4);
  v5 = v4;
  if (v4) {
    -[MTTVSettingsPodcastTableViewCell configureSubviews](v4, "configureSubviews");
  }
  return v5;
}

- (void)configureSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell leftImageView](self, "leftImageView"));
  [v3 addSubview:v4];

  -[MTTVSettingsPodcastTableViewCell setOnOffLabel:](self, "setOnOffLabel:", 0LL);
  -[MTTVSettingsPodcastTableViewCell updateColors](self, "updateColors");
}

- (void)updateWithPodcast:(id)a3
{
  id v4 = a3;
  -[MTTVSettingsPodcastTableViewCell updateImageForPodcast:](self, "updateImageForPodcast:", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 title]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell textLabel](self, "textLabel"));
  [v5 setText:v6];
}

- (void)setDim:(BOOL)a3
{
  if (self->_dim != a3)
  {
    self->_dim = a3;
    if (a3)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell dimView](self, "dimView"));
      [v5 addSubview:v4];
    }

    else
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell dimView](self, "dimView"));
      [v5 removeFromSuperview];
    }
  }

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[MTTVSettingsPodcastTableViewCell setOnOffLabel:](self, "setOnOffLabel:");
  }

- (UIView)dimView
{
  dimView = self->_dimView;
  if (!dimView)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    id v5 = self->_dimView;
    self->_dimView = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[UIView setBackgroundColor:](self->_dimView, "setBackgroundColor:", v6);

    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_dimView, "layer"));
    [v7 setCornerRadius:6.0];

    dimView = self->_dimView;
  }

  return dimView;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___MTTVSettingsPodcastTableViewCell;
  -[MTTVSettingsPodcastTableViewCell layoutSubviews](&v54, "layoutSubviews");
  id v3 = -[MTTVSettingsPodcastTableViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  -[MTTVSettingsPodcastTableViewCell offSetHeight](self, "offSetHeight");
  double v14 = v13;
  if (v3 == (id)1)
  {
    v55.origin.x = v6;
    v55.origin.y = v8;
    v55.size.width = v10;
    v55.size.height = v12;
    double MaxX = CGRectGetMaxX(v55);
    v56.origin.x = 0.0;
    v56.origin.y = 0.0;
    v56.size.width = v14;
    v56.size.height = v14;
    double v16 = MaxX - CGRectGetWidth(v56);
    v57.origin.x = 0.0;
    v57.origin.y = 0.0;
    v57.size.width = v14;
    v57.size.height = v14;
    double v17 = v16 - CGRectGetMinX(v57);
  }

  else
  {
    double v17 = 0.0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell leftImageView](self, "leftImageView"));
  objc_msgSend(v18, "setFrame:", v17, 0.0, v14, v14);

  id v19 = objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]( &OBJC_CLASS___UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 5LL, 0.0, 0.0, v14, v14, 6.0, 6.0));
  id v20 = [v19 CGPath];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell leftImageMaskLayer](self, "leftImageMaskLayer"));
  [v21 setPath:v20];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell textLabel](self, "textLabel"));
  [v22 frame];
  double v24 = v23;
  CGFloat rect = v25;
  double v27 = v26;

  if (v3 == (id)1)
  {
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v10;
    v58.size.height = v12;
    CGFloat v52 = v10;
    CGFloat v28 = v8;
    CGFloat v29 = v6;
    double v30 = CGRectGetMaxX(v58);
    v59.origin.x = v14 + 24.0;
    v59.origin.y = v24;
    v59.size.width = rect;
    v59.size.height = v27;
    double v31 = v30 - CGRectGetWidth(v59);
    v60.origin.x = v14 + 24.0;
    v60.origin.y = v24;
    v60.size.width = rect;
    v60.size.height = v27;
    double v32 = v31 - CGRectGetMinX(v60);
    v61.origin.x = v29;
    v61.origin.y = v28;
    v61.size.width = v52;
    v61.size.height = v12;
    double v33 = CGRectGetMaxX(v61);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell detailTextLabel](self, "detailTextLabel"));
    [v34 frame];
    double MinX = v33 - CGRectGetMaxX(v62);
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell detailTextLabel](self, "detailTextLabel"));
    [v34 frame];
    double MinX = CGRectGetMinX(v63);
    double v32 = v14 + 24.0;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  [v36 frame];
  double v38 = v37 - MinX + 24.0;

  v64.origin.x = v32;
  v64.origin.y = v24;
  v64.size.width = rect;
  v64.size.height = v27;
  double Width = CGRectGetWidth(v64);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  [v40 frame];
  double v42 = v41 - (v14 + 24.0) - v38;

  if (v3 == (id)1)
  {
    v65.origin.x = v32;
    v65.origin.y = v24;
    v65.size.width = v42;
    v65.size.height = v27;
    double v32 = v32 + Width - CGRectGetWidth(v65);
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v43, "setFrame:", v32, v24, v42, v27);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  [v44 bounds];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell dimView](self, "dimView"));
  objc_msgSend(v51, "setFrame:", v46, v48, v50, v14);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVSettingsPodcastTableViewCell;
  id v4 = a3;
  -[MTTVSettingsPodcastTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVSettingsPodcastTableViewCell traitCollection]( self,  "traitCollection",  v8.receiver,  v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTTVSettingsPodcastTableViewCell updateColors](self, "updateColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVSettingsPodcastTableViewCell;
  id v6 = a4;
  -[MTTVSettingsPodcastTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AAB9C;
  v7[3] = &unk_10023FF98;
  v7[4] = self;
  [v6 addCoordinatedAnimations:0 completion:v7];
}

- (double)offSetHeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell contentView](self, "contentView"));
  [v2 frame];
  double v4 = v3 + 1.0;

  return v4;
}

- (void)updateImageForPodcast:(id)a3
{
  id v4 = a3;
  -[MTTVSettingsPodcastTableViewCell offSetHeight](self, "offSetHeight");
  double v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageInMemoryForKey:size:", v7, v6, v6));

  if (!v9)
  {
    CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageForKey:size:", kMTLibraryDefaultImageKey, v6, v6));

    objc_initWeak(&location, self);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000AAD9C;
    v13[3] = &unk_100243680;
    id v14 = v7;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v11, "asyncImageForKey:size:completionHandler:", v14, v13, v6, v6);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell leftImageView](self, "leftImageView"));
  [v12 setImage:v9];
}

- (void)setOnOffLabel:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = v5;
  if (v3) {
    double v6 = @"INCLUDE_PODCAST_ON";
  }
  else {
    double v6 = @"INCLUDE_PODCAST_Off";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v6 value:&stru_100248948 table:0]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell detailTextLabel](self, "detailTextLabel"));
  [v8 setText:v7];
}

- (UIImageView)leftImageView
{
  leftImageView = self->_leftImageView;
  if (!leftImageView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    double v5 = self->_leftImageView;
    self->_leftImageView = v4;

    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVSettingsPodcastTableViewCell leftImageMaskLayer](self, "leftImageMaskLayer"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_leftImageView, "layer"));
    [v7 setMask:v6];

    leftImageView = self->_leftImageView;
  }

  return leftImageView;
}

- (CAShapeLayer)leftImageMaskLayer
{
  leftImageMaskLayer = self->_leftImageMaskLayer;
  if (!leftImageMaskLayer)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___CAShapeLayer);
    double v5 = self->_leftImageMaskLayer;
    self->_leftImageMaskLayer = v4;

    leftImageMaskLayer = self->_leftImageMaskLayer;
  }

  return leftImageMaskLayer;
}

- (BOOL)dim
{
  return self->_dim;
}

- (BOOL)on
{
  return self->_on;
}

- (void)setLeftImageView:(id)a3
{
}

- (void)setLeftImageMaskLayer:(id)a3
{
}

- (void)setDimView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end