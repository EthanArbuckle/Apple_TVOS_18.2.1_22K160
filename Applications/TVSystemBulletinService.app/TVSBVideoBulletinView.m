@interface TVSBVideoBulletinView
- (BOOL)fullScreen;
- (BOOL)increasesSizeOnUserInteraction;
- (CGRect)frameForContentView;
- (NSArray)volatileContraints;
- (NSAttributedString)subtitle;
- (NSLayoutConstraint)topConstraint;
- (NSString)title;
- (TVHMCameraContentView)videoView;
- (TVSBVideoBulletinChinView)chinView;
- (TVSBVideoBulletinView)initWithFrame:(CGRect)a3;
- (TVSBVideoBulletinView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (TVSUIOuterShadowView)shadowView;
- (UIImage)image;
- (UIView)contentView;
- (UIView)innerContentView;
- (UIView)videoContainerView;
- (UIVisualEffectView)platterBackgroundView;
- (double)aspectRatio;
- (id)_contentViewSizeConstraints;
- (id)preferredFocusEnvironments;
- (int64_t)style;
- (void)_updateCameraViewConstraints;
- (void)setAspectRatio:(double)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setIncreasesSizeOnUserInteraction:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setVideoView:(id)a3;
- (void)setVolatileContraints:(id)a3;
@end

@implementation TVSBVideoBulletinView

- (TVSBVideoBulletinView)initWithFrame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = 0LL;
  v5 = -[TVSBVideoBulletinView initWithFrame:style:]( self,  "initWithFrame:style:",  0LL,  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (TVSBVideoBulletinView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CGRect v93 = a3;
  SEL v91 = a2;
  int64_t v90 = a4;
  v92 = 0LL;
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinView;
  v92 = -[TVSBVideoBulletinView initWithFrame:]( &v89,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v92, v92);
  if (v92)
  {
    v88.receiver = v92;
    v88.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinView;
    -[TVSBVideoBulletinView setUserInteractionEnabled:](&v88, "setUserInteractionEnabled:", 0LL);
    v92->_style = v90;
    -[TVSBVideoBulletinView tvsb_setDebugLayoutColorType:](v92, "tvsb_setDebugLayoutColorType:");
    v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    contentView = v92->_contentView;
    v92->_contentView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_contentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView tvsb_setDebugLayoutColorType:](v92->_contentView, "tvsb_setDebugLayoutColorType:", 8LL);
    v87 = -[UIView layer](v92->_contentView, "layer");
    -[CALayer setAllowsGroupBlending:](v87, "setAllowsGroupBlending:", 0LL);
    -[CALayer setAllowsGroupOpacity:](v87, "setAllowsGroupOpacity:", 0LL);
    -[TVSBVideoBulletinView addSubview:](v92, "addSubview:", v92->_contentView);
    CGRect v6 = objc_alloc_init(&OBJC_CLASS___UIView);
    innerContentView = v92->_innerContentView;
    v92->_innerContentView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_innerContentView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView _setContinuousCornerRadius:](v92->_innerContentView, "_setContinuousCornerRadius:");
    -[UIView setClipsToBounds:](v92->_innerContentView, "setClipsToBounds:", 1LL);
    -[UIView tvsb_setDebugLayoutColorType:](v92->_innerContentView, "tvsb_setDebugLayoutColorType:", 2LL);
    -[UIView addSubview:](v92->_contentView, "addSubview:", v92->_innerContentView);
    v23 = objc_alloc(&OBJC_CLASS___TVSUIOuterShadowView);
    sub_100006BE4();
    v10 = -[TVSUIOuterShadowView initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:]( v23,  "initWithCornerRadius:continuousCorners:shadowOffset:shadowRadius:",  1LL,  24.0,  v8,  v9,  35.0);
    shadowView = v92->_shadowView;
    v92->_shadowView = v10;

    -[TVSUIOuterShadowView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_shadowView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSUIOuterShadowView setAlpha:](v92->_shadowView, "setAlpha:", 0.15);
    -[TVSUIOuterShadowView tvsb_setDebugLayoutColorType:](v92->_shadowView, "tvsb_setDebugLayoutColorType:", 12LL);
    -[UIView addSubview:](v92->_contentView, "addSubview:", v92->_shadowView);
    v12 = objc_alloc_init(&OBJC_CLASS___UIVisualEffectView);
    platterBackgroundView = v92->_platterBackgroundView;
    v92->_platterBackgroundView = v12;

    -[UIVisualEffectView _setGroupName:]( v92->_platterBackgroundView,  "_setGroupName:",  @"TVSBVisualEffectGroupName");
    v24 = v92->_platterBackgroundView;
    v25 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5002LL);
    -[UIVisualEffectView setEffect:](v24, "setEffect:");

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_platterBackgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIVisualEffectView tvsb_setDebugLayoutColorType:]( v92->_platterBackgroundView,  "tvsb_setDebugLayoutColorType:",  6LL);
    v14 = objc_alloc_init(&OBJC_CLASS___UIView);
    videoContainerView = v92->_videoContainerView;
    v92->_videoContainerView = v14;

    -[UIView setClipsToBounds:](v92->_videoContainerView, "setClipsToBounds:", 1LL);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_videoContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView tvsb_setDebugLayoutColorType:](v92->_videoContainerView, "tvsb_setDebugLayoutColorType:", 7LL);
    -[UIView addSubview:](v92->_innerContentView, "addSubview:", v92->_platterBackgroundView);
    -[UIView addSubview:](v92->_innerContentView, "addSubview:", v92->_videoContainerView);
    v16 = objc_alloc(&OBJC_CLASS___TVSBVideoBulletinChinView);
    v17 = -[TVSBVideoBulletinChinView initWithStyle:](v16, "initWithStyle:", v90);
    chinView = v92->_chinView;
    v92->_chinView = v17;

    -[TVSBVideoBulletinChinView tvsb_setDebugLayoutColorType:](v92->_chinView, "tvsb_setDebugLayoutColorType:", 11LL);
    -[TVSBVideoBulletinChinView setTranslatesAutoresizingMaskIntoConstraints:]( v92->_chinView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v92->_innerContentView, "addSubview:", v92->_chinView);
    id v26 = -[TVSBVideoBulletinView layer](v92, "layer");
    [v26 setAllowsGroupOpacity:0];

    v28 = -[UIView topAnchor](v92->_contentView, "topAnchor");
    id v27 = -[TVSBVideoBulletinView topAnchor](v92, "topAnchor");
    v19 = (NSLayoutConstraint *) -[NSLayoutYAxisAnchor constraintEqualToAnchor:constant:]( v28,  "constraintEqualToAnchor:constant:",  57.0);
    topConstraint = v92->_topConstraint;
    v92->_topConstraint = v19;

    v94[0] = v92->_topConstraint;
    id v86 = -[TVSUIOuterShadowView leadingAnchor](v92->_shadowView, "leadingAnchor");
    v85 = -[UIView leadingAnchor](v92->_contentView, "leadingAnchor");
    id v84 = objc_msgSend(v86, "constraintEqualToAnchor:");
    v94[1] = v84;
    id v83 = -[TVSUIOuterShadowView trailingAnchor](v92->_shadowView, "trailingAnchor");
    v82 = -[UIView trailingAnchor](v92->_contentView, "trailingAnchor");
    id v81 = objc_msgSend(v83, "constraintEqualToAnchor:");
    v94[2] = v81;
    id v80 = -[TVSUIOuterShadowView topAnchor](v92->_shadowView, "topAnchor");
    v79 = -[UIView topAnchor](v92->_contentView, "topAnchor");
    id v78 = objc_msgSend(v80, "constraintEqualToAnchor:");
    v94[3] = v78;
    id v77 = -[TVSUIOuterShadowView bottomAnchor](v92->_shadowView, "bottomAnchor");
    v76 = -[UIView bottomAnchor](v92->_contentView, "bottomAnchor");
    id v75 = objc_msgSend(v77, "constraintEqualToAnchor:");
    v94[4] = v75;
    v74 = -[UIView leadingAnchor](v92->_innerContentView, "leadingAnchor");
    v73 = -[UIView leadingAnchor](v92->_contentView, "leadingAnchor");
    id v72 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v74, "constraintEqualToAnchor:");
    v94[5] = v72;
    v71 = -[UIView trailingAnchor](v92->_innerContentView, "trailingAnchor");
    v70 = -[UIView trailingAnchor](v92->_contentView, "trailingAnchor");
    id v69 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v71, "constraintEqualToAnchor:");
    v94[6] = v69;
    v68 = -[UIView topAnchor](v92->_innerContentView, "topAnchor");
    v67 = -[UIView topAnchor](v92->_contentView, "topAnchor");
    id v66 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v68, "constraintEqualToAnchor:");
    v94[7] = v66;
    v65 = -[UIView bottomAnchor](v92->_innerContentView, "bottomAnchor");
    v64 = -[UIView bottomAnchor](v92->_contentView, "bottomAnchor");
    id v63 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v65, "constraintEqualToAnchor:");
    v94[8] = v63;
    v62 = -[UIView leadingAnchor](v92->_videoContainerView, "leadingAnchor");
    v61 = -[UIView leadingAnchor](v92->_innerContentView, "leadingAnchor");
    id v60 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v62, "constraintEqualToAnchor:");
    v94[9] = v60;
    v59 = -[UIView trailingAnchor](v92->_videoContainerView, "trailingAnchor");
    v58 = -[UIView trailingAnchor](v92->_innerContentView, "trailingAnchor");
    id v57 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v59, "constraintEqualToAnchor:");
    v94[10] = v57;
    v56 = -[UIView topAnchor](v92->_videoContainerView, "topAnchor");
    v55 = -[UIView topAnchor](v92->_innerContentView, "topAnchor");
    id v54 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v56, "constraintEqualToAnchor:");
    v94[11] = v54;
    id v53 = -[TVSBVideoBulletinChinView leadingAnchor](v92->_chinView, "leadingAnchor");
    v52 = -[UIView leadingAnchor](v92->_innerContentView, "leadingAnchor");
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v94[12] = v51;
    id v50 = -[TVSBVideoBulletinChinView trailingAnchor](v92->_chinView, "trailingAnchor");
    v49 = -[UIView trailingAnchor](v92->_innerContentView, "trailingAnchor");
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v94[13] = v48;
    id v47 = -[TVSBVideoBulletinChinView topAnchor](v92->_chinView, "topAnchor");
    v46 = -[UIView bottomAnchor](v92->_videoContainerView, "bottomAnchor");
    id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v94[14] = v45;
    id v44 = -[TVSBVideoBulletinChinView bottomAnchor](v92->_chinView, "bottomAnchor");
    v43 = -[UIView bottomAnchor](v92->_innerContentView, "bottomAnchor");
    id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
    v94[15] = v42;
    id v41 = -[UIVisualEffectView leadingAnchor](v92->_platterBackgroundView, "leadingAnchor");
    id v40 = -[TVSBVideoBulletinChinView leadingAnchor](v92->_chinView, "leadingAnchor");
    id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
    v94[16] = v39;
    id v38 = -[UIVisualEffectView trailingAnchor](v92->_platterBackgroundView, "trailingAnchor");
    id v37 = -[TVSBVideoBulletinChinView trailingAnchor](v92->_chinView, "trailingAnchor");
    id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v94[17] = v36;
    id v35 = -[UIVisualEffectView topAnchor](v92->_platterBackgroundView, "topAnchor");
    id v34 = -[TVSBVideoBulletinChinView topAnchor](v92->_chinView, "topAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v94[18] = v33;
    id v32 = -[UIVisualEffectView bottomAnchor](v92->_platterBackgroundView, "bottomAnchor");
    id v31 = -[TVSBVideoBulletinChinView bottomAnchor](v92->_chinView, "bottomAnchor");
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v94[19] = v30;
    v29 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 20LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSBVideoBulletinView _updateCameraViewConstraints](v92, "_updateCameraViewConstraints");
    objc_storeStrong((id *)&v87, 0LL);
  }

  v22 = v92;
  objc_storeStrong((id *)&v92, 0LL);
  return v22;
}

  ;
}

- (void)setVideoView:(id)a3
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v8->_videoView != location[0])
  {
    id v5 = -[TVHMCameraContentView superview](v8->_videoView, "superview");
    v4 = -[TVSBVideoBulletinView videoContainerView](v8, "videoContainerView");
    unsigned __int8 v6 = objc_msgSend(v5, "isEqual:");

    if ((v6 & 1) != 0) {
      -[TVHMCameraContentView removeFromSuperview](v8->_videoView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&v8->_videoView, location[0]);
    if (v8->_videoView)
    {
      -[TVHMCameraContentView setTranslatesAutoresizingMaskIntoConstraints:]( v8->_videoView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[TVHMCameraContentView tvsb_setDebugLayoutColorType:](v8->_videoView, "tvsb_setDebugLayoutColorType:", 9LL);
      v3 = -[TVSBVideoBulletinView videoContainerView](v8, "videoContainerView");
      -[UIView addSubview:](v3, "addSubview:", v8->_videoView);

      -[TVSBVideoBulletinView _updateCameraViewConstraints](v8, "_updateCameraViewConstraints");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setTitle:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v5->_title, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v5->_title, location[0]);
    v3 = -[TVSBVideoBulletinView chinView](v5, "chinView");
    -[TVSBVideoBulletinChinView setTitle:](v3, "setTitle:", v5->_title);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setSubtitle:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSAttributedString isEqualToAttributedString:](v5->_subtitle, "isEqualToAttributedString:", location[0]))
  {
    objc_storeStrong((id *)&v5->_subtitle, location[0]);
    v3 = -[TVSBVideoBulletinView chinView](v5, "chinView");
    -[TVSBVideoBulletinChinView setSubtitle:](v3, "setSubtitle:", v5->_subtitle);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setImage:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v5->_image != location[0] && (-[UIImage isEqual:](v5->_image, "isEqual:", location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_image, location[0]);
    v3 = -[TVSBVideoBulletinView chinView](v5, "chinView");
    -[TVSBVideoBulletinChinView setImage:](v3, "setImage:", v5->_image);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setAspectRatio:(double)a3
{
  if (vabdd_f64(self->_aspectRatio, a3) >= 0.00000011920929)
  {
    self->_aspectRatio = a3;
    -[TVSBVideoBulletinView _updateCameraViewConstraints](self, "_updateCameraViewConstraints");
  }

- (id)preferredFocusEnvironments
{
  double v9 = -[TVSBVideoBulletinView videoView](self, "videoView");
  unsigned __int8 v10 = -[TVHMCameraContentView cameraControlViewsVisible](v9, "cameraControlViewsVisible");

  if ((v10 & 1) != 0)
  {
    double v8 = -[TVSBVideoBulletinView videoView](self, "videoView");
    id v7 = -[TVHMCameraContentView controlCollectionView](v8, "controlCollectionView");
    id v14 = v7;
    v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL);
  }

  else
  {
    id v5 = -[TVSBVideoBulletinView videoView](self, "videoView");
    unsigned __int8 v6 = -[TVHMCameraContentView nearbyAccessoryControlsVisible](v5, "nearbyAccessoryControlsVisible");

    if ((v6 & 1) != 0)
    {
      v4 = -[TVSBVideoBulletinView videoView](self, "videoView");
      id v3 = -[TVHMCameraContentView nearbyAccessoriesViewController](v4, "nearbyAccessoriesViewController");
      id v13 = v3;
      v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL);
    }

    else
    {
      v12 = 0LL;
    }
  }

  return v12;
}

- (CGRect)frameForContentView
{
  if (vabdd_f64(v2, 0.0) < 0.00000011920929)
  {
    sub_100007448(320.625);
  }

  else if (v2 >= 1.0)
  {
    sub_100007448(570.0 / v2);
  }

  else
  {
    sub_100007448(533.0 * v2);
  }

  if (-[TVSBVideoBulletinView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != (id)1)
  {
    -[TVSBVideoBulletinView bounds](self, "bounds");
    CGRectGetMaxX(v8);
  }

  sub_100007460();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_updateCameraViewConstraints
{
  double v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[TVSBVideoBulletinView _contentViewSizeConstraints](self, "_contentViewSizeConstraints");
  double v2 = -[TVSBVideoBulletinView volatileContraints](v4, "volatileContraints");
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:");

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v3[0]);
  -[TVSBVideoBulletinView setVolatileContraints:](v4, "setVolatileContraints:", v3[0]);
  objc_storeStrong(v3, 0LL);
}

- (id)_contentViewSizeConstraints
{
  v46 = self;
  SEL v45 = a2;
  -[TVSBVideoBulletinView aspectRatio](self, "aspectRatio");
  double v41 = v2;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (vabdd_f64(v41, 0.0) < 0.00000011920929)
  {
    double v44 = 80.0;
    double v43 = 570.0;
    double v42 = sub_100007448(320.625);
  }

  else
  {
    double v44 = 80.0;
    if (v41 >= 1.0)
    {
      double v43 = 570.0;
      double v42 = sub_100007448(570.0 / v41);
    }

    else
    {
      double v42 = 533.0;
      double v39 = sub_100007448(533.0 * v41);
      uint64_t v38 = 0x407C200000000000LL;
      if (v39 >= 450.0) {
        double v35 = v39;
      }
      else {
        double v35 = *(double *)&v38;
      }
      v37[1] = *(id *)&v35;
      double v43 = v35;
    }
  }

  v37[0] = -[TVSBVideoBulletinView contentView](v46, "contentView");
  id v36 = -[TVSBVideoBulletinView videoContainerView](v46, "videoContainerView");
  id v30 = [v37[0] widthAnchor];
  id v29 = [v30 constraintEqualToConstant:v43];
  -[NSMutableArray addObject:](v40, "addObject:");

  id v32 = -[UIView heightAnchor](v36, "heightAnchor");
  id v31 = -[NSLayoutDimension constraintEqualToConstant:](v32, "constraintEqualToConstant:", v42);
  -[NSMutableArray addObject:](v40, "addObject:");

  id v33 = -[TVSBVideoBulletinView videoView](v46, "videoView");
  unsigned __int8 v34 = -[TVHMCameraContentView isDescendantOfView:](v33, "isDescendantOfView:", v36);

  if ((v34 & 1) != 0)
  {
    v16 = -[UIView widthAnchor](v36, "widthAnchor");
    v15 = -[TVSBVideoBulletinView videoView](v46, "videoView");
    id v14 = -[TVHMCameraContentView widthAnchor](v15, "widthAnchor");
    id v13 = -[NSLayoutDimension constraintEqualToAnchor:](v16, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v40, "addObject:");

    v20 = -[UIView heightAnchor](v36, "heightAnchor");
    v19 = -[TVSBVideoBulletinView videoView](v46, "videoView");
    id v18 = -[TVHMCameraContentView heightAnchor](v19, "heightAnchor");
    id v17 = -[NSLayoutDimension constraintEqualToAnchor:](v20, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v40, "addObject:");

    v24 = -[UIView centerXAnchor](v36, "centerXAnchor");
    v23 = -[TVSBVideoBulletinView videoView](v46, "videoView");
    id v22 = -[TVHMCameraContentView centerXAnchor](v23, "centerXAnchor");
    id v21 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v24, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v40, "addObject:");

    v28 = -[UIView centerYAnchor](v36, "centerYAnchor");
    id v27 = -[TVSBVideoBulletinView videoView](v46, "videoView");
    id v26 = -[TVHMCameraContentView centerYAnchor](v27, "centerYAnchor");
    id v25 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v28, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v40, "addObject:");
  }

  id v7 = objc_msgSend(v37[0], "bottomAnchor", v40);
  double v6 = -[UIView bottomAnchor](v36, "bottomAnchor");
  id v5 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", 80.0);
  objc_msgSend(v4, "addObject:");

  CGRect v8 = v40;
  id v11 = [v37[0] trailingAnchor];
  id v10 = -[TVSBVideoBulletinView trailingAnchor](v46, "trailingAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -v44);
  -[NSMutableArray addObject:](v8, "addObject:");

  id v12 = -[NSMutableArray copy](v40, "copy");
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong(v37, 0LL);
  objc_storeStrong((id *)&v40, 0LL);
  return v12;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)style
{
  return self->_style;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (TVHMCameraContentView)videoView
{
  return self->_videoView;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)increasesSizeOnUserInteraction
{
  return self->_increasesSizeOnUserInteraction;
}

- (void)setIncreasesSizeOnUserInteraction:(BOOL)a3
{
  self->_increasesSizeOnUserInteraction = a3;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (UIView)videoContainerView
{
  return self->_videoContainerView;
}

- (TVSBVideoBulletinChinView)chinView
{
  return self->_chinView;
}

- (UIView)innerContentView
{
  return self->_innerContentView;
}

- (UIVisualEffectView)platterBackgroundView
{
  return self->_platterBackgroundView;
}

- (TVSUIOuterShadowView)shadowView
{
  return self->_shadowView;
}

- (NSArray)volatileContraints
{
  return self->_volatileContraints;
}

- (void)setVolatileContraints:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end